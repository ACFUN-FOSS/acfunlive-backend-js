@@warning("-37")

open AcLive__WebSocket
open Promise

type webSocket

type rec t = {
  mutable webSocket: option<webSocket>,
  openListeners: array<event<t> => unit>,
  closeListeners: array<closeEvent<t> => unit>,
  messageListeners: array<messageEvent<t> => unit>,
  errorListeners: array<errorEvent<t> => unit>,
}

type closeFrame = {code: int, reason: string}

@tag("type")
type message =
  | Text({data: string})
  | Binary({data: unknown})
  | Ping({data: unknown})
  | Pong({data: unknown})
  | Close({data: Null.t<closeFrame>})

@tag("type")
type listenerArgument =
  | ...message
  | Error({data: string})

@module("tauri-plugin-websocket-api") @scope("default")
external connect: string => promise<webSocket> = "connect"

@send
external addListener: (webSocket, Null.t<listenerArgument> => unit) => unit = "addListener"

@send
external sendMessage: (webSocket, string) => promise<unit> = "send"

@send
external disconnect: webSocket => promise<unit> = "disconnect"

let convertCloseFrame = (ws, frame) =>
  switch frame {
  | Js.Null.Value(data) => {
      type_: Close,
      target: ws,
      code: data.code,
      reason: data.reason,
    }
  | Js.Null.Null => {
      type_: Close,
      target: ws,
    }
  }

let notifyListeners = (arr, event) => arr->Array.forEach(fn => fn(event))

let clear = ws => {
  ws.webSocket = None
  ws.openListeners->Belt.Array.truncateToLengthUnsafe(0)
  ws.closeListeners->Belt.Array.truncateToLengthUnsafe(0)
  ws.messageListeners->Belt.Array.truncateToLengthUnsafe(0)
  ws.errorListeners->Belt.Array.truncateToLengthUnsafe(0)
}

let notifyError = (ws, e) => {
  let event = switch e {
  | Exn.Error(e) => {
      type_: Error_,
      target: ws,
      error: e,
    }
  | _ => {
      type_: Error_,
      target: ws,
    }
  }

  ws.errorListeners->notifyListeners(event)
}

let isOpen = ws => ws.webSocket->Option.isSome

/** 如果WebSocket还在就清空 */
let clearAndNotifyClose = ws =>
  if ws->isOpen {
    let event: closeEvent<t> = {
      type_: Close,
      target: ws,
    }
    ws.closeListeners->notifyListeners(event)
    ws->clear
  }

let close = ws =>
  switch ws.webSocket {
  | Some(w) =>
    w
    ->disconnect
    //->thenResolve(_ => ws->closeWithCode(1000))
    ->catch(e => {
      notifyError(ws, e)
      ws->clearAndNotifyClose->resolve
    })
    ->finally(() => setTimeout(() => ws->clearAndNotifyClose, 15000)->ignore)
    ->done
  | None => ()
  }

let make = url => {
  let ws = {
    webSocket: None,
    openListeners: [],
    closeListeners: [],
    messageListeners: [],
    errorListeners: [],
  }
  connect(url)
  ->thenResolve(w => {
    ws.webSocket = Some(w)
    w->addListener(m =>
      switch m {
      | Js.Null.Value(Text({data})) => {
          let event = {
            type_: Message,
            target: ws,
            data,
          }
          ws.messageListeners->notifyListeners(event)
        }
      | Js.Null.Value(Close({data})) =>
        if ws->isOpen {
          let event = ws->convertCloseFrame(data)
          ws.closeListeners->notifyListeners(event)
          ws->clear
        }
      | Js.Null.Value(Error({data})) => {
          let event = {
            type_: Error_,
            target: ws,
            message: data,
          }
          ws.errorListeners->notifyListeners(event)
        }
      | _ => ()
      }
    )

    let event = {
      type_: Open,
      target: ws,
    }
    ws.openListeners->notifyListeners(event)
  })
  ->catch(e => {
    notifyError(ws, e)
    ws->close->resolve
  })
  ->done

  ws
}

let send = (ws, message) =>
  switch ws.webSocket {
  | Some(w) => w->sendMessage(message)->catch(e => notifyError(ws, e)->resolve)->done
  | None => ()
  }

let addOpenListener = (ws, fn) => ws.openListeners->Array.push(fn)

let addCloseListener = (ws, fn) => ws.closeListeners->Array.push(fn)

let addMessageListener = (ws, fn) => ws.messageListeners->Array.push(fn)

let addErrorListener = (ws, fn) => ws.errorListeners->Array.push(fn)
