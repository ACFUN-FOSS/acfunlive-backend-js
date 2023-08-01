// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Core__Dict from "@rescript/core/src/Core__Dict.bs.mjs";
import * as Caml_option from "rescript/lib/es6/caml_option.js";

function addSubcriber(d, subcriber) {
  var id = d.nextId.contents;
  d.nextId.contents = id + 1 | 0;
  d.dict[id.toString()] = subcriber;
  return function () {
    Core__Dict.$$delete(d.dict, id.toString());
  };
}

function callSubcribers(d, value, key) {
  Object.values(d.dict).forEach(function (s) {
        s(value, key);
      });
}

var isEmpty = (function (obj) {
    for (var i in obj) {
      return false;
    }

    return true;
  });

function addSubcriberInDict(dict, subcriber, key) {
  var d = dict[key];
  var d$1;
  if (d !== undefined) {
    d$1 = d;
  } else {
    var d_nextId = {
      contents: 0
    };
    var d_dict = {};
    var d$2 = {
      nextId: d_nextId,
      dict: d_dict
    };
    dict[key] = d$2;
    d$1 = d$2;
  }
  var unsubscribe = addSubcriber(d$1, subcriber);
  return function () {
    unsubscribe(undefined);
    if (isEmpty(d$1.dict)) {
      return Core__Dict.$$delete(dict, key);
    }
    
  };
}

function make() {
  var value = {
    contents: undefined
  };
  var notifyAll_nextId = {
    contents: 0
  };
  var notifyAll_dict = {};
  var notifyAll = {
    nextId: notifyAll_nextId,
    dict: notifyAll_dict
  };
  var notifyKey = {};
  var oneshotKey = {};
  var set = function (v, key) {
    value.contents = Caml_option.some(v);
    callSubcribers(notifyAll, v, key);
    var d = notifyKey[key];
    if (d !== undefined) {
      callSubcribers(d, v, key);
    }
    var d$1 = oneshotKey[key];
    if (d$1 !== undefined) {
      callSubcribers(d$1, v, key);
      return Core__Dict.$$delete(oneshotKey, key);
    }
    
  };
  var subcribe = function (subcriber, key) {
    if (key !== undefined) {
      return addSubcriberInDict(notifyKey, subcriber, key);
    } else {
      return addSubcriber(notifyAll, subcriber);
    }
  };
  var oneshot = function (subcriber, key) {
    return addSubcriberInDict(oneshotKey, subcriber, key);
  };
  return {
          set: set,
          subcribe: subcribe,
          oneshot: oneshot
        };
}

export {
  make ,
}
/* No side effect */
