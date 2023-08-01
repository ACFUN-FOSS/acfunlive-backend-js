type unsubscribe = unit => unit

type subcriber<'a> = ('a, ~key: string) => unit

type t<'a> = {
  set: ('a, ~key: string) => unit,
  subcribe: (subcriber<'a>, ~key: string=?) => unsubscribe,
  oneshot: (subcriber<'a>, ~key: string) => unsubscribe,
}

type subcriberDict<'a> = {
  nextId: ref<int>,
  dict: Dict.t<subcriber<'a>>,
}

let addSubcriber = (d, subcriber) => {
  let id = d.nextId.contents
  d.nextId := id + 1
  d.dict->Dict.set(id->Int.toString, subcriber)

  () => d.dict->Dict.delete(id->Int.toString)
}

let callSubcribers = (d, value, ~key) =>
  d.dict->Dict.valuesToArray->Array.forEach(s => s(value, ~key))

let isEmpty: Dict.t<'a> => bool = %raw(`
  function (obj) {
    for (var i in obj) {
      return false;
    }

    return true;
  }
`)

let addSubcriberInDict = (dict, subcriber, ~key) => {
  let d = switch dict->Dict.get(key) {
  | Some(d) => d
  | None => {
      let d = {
        nextId: ref(0),
        dict: Dict.make(),
      }
      dict->Dict.set(key, d)
      d
    }
  }
  let unsubscribe = d->addSubcriber(subcriber)

  () => {
    unsubscribe()
    if d.dict->isEmpty {
      dict->Dict.delete(key)
    }
  }
}

let make = () => {
  let value = ref(None)
  let notifyAll = {
    nextId: ref(0),
    dict: Dict.make(),
  }
  let notifyKey = Dict.make()
  let oneshotKey = Dict.make()

  let set = (v, ~key) => {
    value := Some(v)
    notifyAll->callSubcribers(v, ~key)
    switch notifyKey->Dict.get(key) {
    | Some(d) => d->callSubcribers(v, ~key)
    | None => ()
    }
    switch oneshotKey->Dict.get(key) {
    | Some(d) => {
        d->callSubcribers(v, ~key)
        oneshotKey->Dict.delete(key)
      }
    | None => ()
    }
  }

  let subcribe = (subcriber, ~key=?) => {
    switch key {
    | Some(k) => notifyKey->addSubcriberInDict(subcriber, ~key=k)
    | None => notifyAll->addSubcriber(subcriber)
    }
  }

  let oneshot = (subcriber, ~key) => oneshotKey->addSubcriberInDict(subcriber, ~key)

  {
    set,
    subcribe,
    oneshot,
  }
}
