let makeSession = (~config=?) => AcLive__Session.make(module(WebAPI__WebSocket), ~config?)
