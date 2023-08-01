// Generated by ReScript, PLEASE EDIT WITH CARE


function intToResponseType(i) {
  if (i >= 300) {
    if (i >= 2000) {
      if (i >= 2104) {
        if (i > 3002 || i < 2999) {
          return {
                  TAG: "UnknownResponse",
                  _0: i
                };
        } else {
          return i;
        }
      } else if (i > 2099 || i < 2006) {
        return i;
      } else {
        return {
                TAG: "UnknownResponse",
                _0: i
              };
      }
    } else if (i >= 910) {
      if (i > 1008 || i < 1000) {
        return {
                TAG: "UnknownResponse",
                _0: i
              };
      } else {
        return i;
      }
    } else if (i > 899 || i < 306) {
      return i;
    } else {
      return {
              TAG: "UnknownResponse",
              _0: i
            };
    }
  } else if (i >= 112) {
    if (i >= 117) {
      if (i > 205 || i < 200) {
        return {
                TAG: "UnknownResponse",
                _0: i
              };
      } else {
        return i;
      }
    } else if (i !== 113) {
      return i;
    } else {
      return {
              TAG: "UnknownResponse",
              _0: i
            };
    }
  } else if (i >= 7) {
    if (i > 110 || i < 100) {
      return {
              TAG: "UnknownResponse",
              _0: i
            };
    } else {
      return i;
    }
  } else if (i > 0) {
    return i;
  } else {
    return {
            TAG: "UnknownResponse",
            _0: i
          };
  }
}

function intToResponseResult(i) {
  switch (i) {
    case 1 :
        return "Success";
    case 2 :
    case 3 :
    case 4 :
    case 5 :
    case 6 :
    case 7 :
    case 8 :
    case 9 :
        return {
                TAG: "UnknownResult",
                _0: i
              };
    case 10 :
        return "JsonParseError";
    case 11 :
        return "InvalidRequestType";
    case 12 :
        return "InvalidRequestData";
    case 13 :
        return "HandleRequestError";
    case 14 :
        return "NeedLogin";
    default:
      return {
              TAG: "UnknownResult",
              _0: i
            };
  }
}

function makeMessage(data, requestIDOpt) {
  var requestID = requestIDOpt !== undefined ? requestIDOpt : "";
  return {
          requestID: requestID,
          data: data
        };
}

function makeEmptyMessage(requestIDOpt) {
  var requestID = requestIDOpt !== undefined ? requestIDOpt : "";
  return {
          requestID: requestID
        };
}

function getResponseRequestId(response) {
  return response._0.requestID;
}

function getEmptyResponseRequestId(response) {
  return response._0.requestID;
}

function getOptionalResponseRequestId(response) {
  return response._0.requestID;
}

function intToManagerType(i) {
  if (i !== 0) {
    if (i !== 1) {
      return {
              TAG: "UnknownManagerType",
              _0: i
            };
    } else {
      return "NormalManager";
    }
  } else {
    return "NotManager";
  }
}

function intToGiftPayType(i) {
  if (i !== 1) {
    if (i !== 2) {
      return {
              TAG: "UnknownGiftPayType",
              _0: i
            };
    } else {
      return "FreeGift";
    }
  } else {
    return "NonFreeGift";
  }
}

function intToSharePlatformType(i) {
  switch (i) {
    case 1 :
        return "QQ";
    case 2 :
        return "Qzone";
    case 3 :
        return "Weibo";
    case 4 :
        return "WeChat";
    case 5 :
        return "WeChatMoments";
    case 6 :
        return "AcFunMoment";
    default:
      return {
              TAG: "UnknownPlatform",
              _0: i
            };
  }
}

function intToRedpackDisplayStatus(i) {
  switch (i) {
    case 0 :
        return "RedpackShow";
    case 1 :
        return "RedpackGetToken";
    case 2 :
        return "RedpackGrab";
    default:
      return {
              TAG: "UnknownRedpackDisplayStatus",
              _0: i
            };
  }
}

function intToChatMediaType(i) {
  if (i !== 1) {
    if (i !== 2) {
      return {
              TAG: "UnknownChatMediaType",
              _0: i
            };
    } else {
      return "Video";
    }
  } else {
    return "Audio";
  }
}

function intToChatEndType(i) {
  switch (i) {
    case 1 :
        return "CancelByAuthor";
    case 2 :
        return "EndByAuthor";
    case 3 :
        return "EndByGuest";
    case 4 :
        return "GuestReject";
    case 5 :
        return "GuestTimeout";
    case 6 :
        return "GuestHeartbeatTimeout";
    case 7 :
        return "AuthorHeartbeatTimeout";
    case 8 :
        return "PeerLiveStopped";
    default:
      return {
              TAG: "UnknownChatEndType",
              _0: i
            };
  }
}

function intToManagerStateType(i) {
  switch (i) {
    case 0 :
        return "NotManager";
    case 1 :
        return "ManagerAdded";
    case 2 :
        return "ManagerRemoved";
    case 3 :
        return "IsManager";
    default:
      return {
              TAG: "UnknownManagerStateType",
              _0: i
            };
  }
}

var heartbeat = "{\"type\":1}";

export {
  heartbeat ,
  intToResponseType ,
  intToResponseResult ,
  makeMessage ,
  makeEmptyMessage ,
  getResponseRequestId ,
  getEmptyResponseRequestId ,
  getOptionalResponseRequestId ,
  intToManagerType ,
  intToGiftPayType ,
  intToSharePlatformType ,
  intToRedpackDisplayStatus ,
  intToChatMediaType ,
  intToChatEndType ,
  intToManagerStateType ,
}
/* No side effect */
