open AcLive__WebSocket

type t

@new
external make: string => t = "WebSocket"

@val @scope("WebSocket")
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
external removeOpenListener: (t, @as("open") _, event<t> => unit) => unit = "removeEventListener"

@send
external addCloseListener: (t, @as("close") _, closeEvent<t> => unit) => unit = "addEventListener"

@send
external removeCloseListener: (t, @as("close") _, closeEvent<t> => unit) => unit =
  "removeEventListener"

@send
external addMessageListener: (t, @as("message") _, messageEvent<t> => unit) => unit =
  "addEventListener"

@send
external removeMessageListener: (t, @as("message") _, messageEvent<t> => unit) => unit =
  "removeEventListener"

@send
external addErrorListener: (t, @as("error") _, errorEvent<t> => unit) => unit = "addEventListener"

@send
external removeErrorListener: (t, @as("error") _, errorEvent<t> => unit) => unit =
  "removeEventListener"
