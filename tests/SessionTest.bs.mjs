// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Core__Option from "@rescript/core/src/Core__Option.bs.mjs";
import * as AcFunLiveBackend from "../src/AcFunLiveBackend.bs.mjs";
import * as Caml_js_exceptions from "@rescript/std/lib/es6/caml_js_exceptions.js";

var session = AcFunLiveBackend.makeNodeSession(undefined);

session.connect(undefined);

session.on("heartbeat", (function () {
        console.log("heartbeat");
      }), undefined, undefined);

session.on("login", (function (v) {
        console.log("login: ", v);
      }), undefined, undefined);

session.on("getDanmaku", (function (v) {
        console.log("get danmaku: ", v);
      }), "aaa", (function (e) {
        console.log("get danmaku error: ", e);
      }));

async function action() {
  try {
    var info = await session.oneshot("login", {
          account: "",
          password: ""
        }, undefined, undefined);
    console.log("login call: ", info);
    var liveList = await session.oneshot("getAllLiveList", undefined, undefined, undefined);
    console.log("live list: ", liveList);
    var stream = await session.oneshot("getDanmaku", {
          liverUID: Core__Option.getExn(liveList.data[0]).profile.userID
        }, undefined, undefined);
    console.log("get danmaku stream: ", stream);
    return ;
  }
  catch (raw_e){
    var e = Caml_js_exceptions.internalToOCamlException(raw_e);
    console.log("action error: ", e);
    return ;
  }
}

session.on("websocketOpen", (function () {
        console.log("websocket open");
        action(undefined);
      }), undefined, undefined);

session.on("jsonError", (function (v) {
        console.log("json error: ", v);
      }), undefined, undefined);

session.on("websocketError", (function (e) {
        console.log("websocket error: ", e);
      }), undefined, undefined);

session.on("websocketClose", (function () {
        console.log("websocket close");
      }), undefined, undefined);

session.on("danmakuStop", (function (param) {
        console.log("danmaku stop");
        session.disConnect(undefined);
      }), undefined, undefined);

session.on("danmakuStopError", (function (e) {
        console.log("danmaku stop error: ", e);
        session.disConnect(undefined);
      }), undefined, undefined);

export {
  session ,
  action ,
}
/* session Not a pure module */
