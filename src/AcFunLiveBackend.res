let makeWebAPISession = (~config=?) => AcLive__Session.make(module(WebAPI__WebSocket), ~config?)

let makeNodeSession = (~config=?) => AcLive__Session.make(module(Node__WebSocket), ~config?)

let makeTauriSession = (~config=?) => AcLive__Session.make(module(Tauri__WebSocket), ~config?)
