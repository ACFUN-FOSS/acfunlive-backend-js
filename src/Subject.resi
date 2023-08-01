type unsubscribe = unit => unit

type subcriber<'a> = ('a, ~key: string) => unit

type t<'a> = {
  set: ('a, ~key: string) => unit,
  subcribe: (subcriber<'a>, ~key: string=?) => unsubscribe,
  oneshot: (subcriber<'a>, ~key: string) => unsubscribe,
}

let make: unit => t<'a>
