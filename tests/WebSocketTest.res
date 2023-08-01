open Node__WebSocket

let ws = make("ws://localhost:15368")

let interval = ref(None)

ws->addOpenListener(event => {
  Console.log(ws->isOpen)
  Console.log(event.type_)
  Console.log(event.target === ws)

  interval := Some(setInterval(() => {
        ws->send("{\"type\": 1}")
      }, 5000))
})

ws->addCloseListener(event => Console.log(event))

ws->addMessageListener(event => Console.log2(event.type_, event.data))

ws->addErrorListener(event => Console.log(event))

setTimeout(() => {
  ws->close
  switch interval.contents {
  | Some(i) => i->clearInterval
  | None => ()
  }
}, 10000)->ignore
