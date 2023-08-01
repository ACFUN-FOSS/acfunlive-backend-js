let makeSession = (~config=?) => AcLive__Session.make(module(Tauri__WebSocket), ~config?)
