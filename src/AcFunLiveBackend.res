module Message = AcLive__Message

module Session = AcLive__Session

let makeWebAPISession = (~config=?) => Session.make(module(WebAPI__WebSocket), ~config?)

let makeNodeSession = (~config=?) => Session.make(module(Node__WebSocket), ~config?)

let makeTauriSession = (~config=?) => Session.make(module(Tauri__WebSocket), ~config?)
