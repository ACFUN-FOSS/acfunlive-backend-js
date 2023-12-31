let session = AcFunLiveBackend.makeNodeSession()

session.connect()
session.on(Heartbeat, ~onData=() => Console.log("heartbeat"))->ignore
session.on(Login, ~onData=v => Console.log2("login: ", v))->ignore
session.on(
  GetDanmaku,
  ~onData=v => Console.log2("get danmaku: ", v),
  ~onError=e => Console.log2("get danmaku error: ", e),
  ~key="aaa",
)->ignore

let action = async () => {
  try {
    let info = await session.asyncRequest(Login, {account: "", password: ""})
    Console.log2("login call: ", info)

    let liveList = await session.asyncRequest(GetAllLiveList, ())
    Console.log2("live list: ", liveList)

    let liverUID = (liveList.data[0]->Option.getExn).profile.userID
    let stream = await session.asyncRequest(GetDanmaku, {liverUID: liverUID})
    Console.log2("get danmaku stream: ", stream)

    setTimeout(() => {
      try {
        session.asyncRequest(StopDanmaku, {liverUID: liverUID})->ignore
      } catch {
      | e => Console.log2("stop danmaku error: ", e)
      }
    }, 10000)->ignore
  } catch {
  | e => Console.log2("action error: ", e)
  }
}

session.on(WebsocketOpen, ~onData=() => {
  Console.log("websocket open")
  action()->Promise.done
})->ignore
session.on(JsonError, ~onData=v => Console.log2("json error: ", v))->ignore
session.on(WebsocketError, ~onData=e => Console.log2("websocket error: ", e))->ignore
session.on(WebsocketClose, ~onData=() => Console.log("websocket close"))->ignore
session.on(DanmakuStop, ~onData=_ => {
  Console.log("danmaku stop")
  session.disconnect()
})->ignore
session.on(DanmakuStopError, ~onData=e => {
  Console.log2("danmaku stop error: ", e)
  session.disconnect()
})->ignore
