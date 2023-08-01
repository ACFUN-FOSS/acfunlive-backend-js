open AcLive__WebSocket

type t

@module("ws") @new
external make: string => t = "WebSocket"

@module("ws") @scope("WebSocket")
external readyStateOpen: int = "OPEN"

@get
external readyState: t => int = "readyState"

let isOpen = ws => ws->readyState === readyStateOpen

@send
external send: (t, string) => unit = "send"

@send
external close: t => unit = "close"

@send
external addOpenListener: (t, @as("open") _, event<t> => unit) => unit = "addEventListener"

@send
external addCloseListener: (t, @as("close") _, closeEvent<t> => unit) => unit = "addEventListener"

@send
external addMessageListener: (t, @as("message") _, messageEvent<t> => unit) => unit =
  "addEventListener"

@send
external addErrorListener: (t, @as("error") _, errorEvent<t> => unit) => unit = "addEventListener"
