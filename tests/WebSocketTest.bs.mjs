// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Node__WebSocket from "../src/websocket/Node__WebSocket.bs.mjs";

var ws = Node__WebSocket.make("ws://localhost:15368");

var interval = {
  contents: undefined
};

Node__WebSocket.addOpenListener(ws, (function ($$event) {
        console.log(Node__WebSocket.isOpen(ws));
        console.log($$event.type);
        console.log($$event.target === ws);
        interval.contents = Caml_option.some(setInterval((function () {
                    Node__WebSocket.send(ws, "{\"type\": 1}");
                  }), 5000));
      }));

Node__WebSocket.addCloseListener(ws, (function ($$event) {
        console.log($$event);
      }));

Node__WebSocket.addMessageListener(ws, (function ($$event) {
        console.log($$event.type, $$event.data);
      }));

Node__WebSocket.addErrorListener(ws, (function ($$event) {
        console.log($$event);
      }));

setTimeout((function () {
        Node__WebSocket.close(ws);
        var i = interval.contents;
        if (i !== undefined) {
          clearInterval(Caml_option.valFromOption(i));
          return ;
        }
        
      }), 10000);

export {
  ws ,
  interval ,
}
/* ws Not a pure module */
