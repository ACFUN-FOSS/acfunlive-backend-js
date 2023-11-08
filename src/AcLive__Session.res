open AcLive__Message
open AcLive__Struct

exception NotConnectBackend
exception AsyncRequestTimeout
exception ResponseError(error)

type websocketError = {
  error?: Error.t,
  message?: string,
}

type jsonError = {
  json?: string,
  error: RescriptStruct.S.error,
}

type rec event<'a, 'b> =
  | @as("websocketOpen") WebsocketOpen: event<unit, unit>
  | @as("websocketClose") WebsocketClose: event<unit, unit>
  | @as("websocketError") WebsocketError: event<websocketError, unit>
  | @as("jsonError") JsonError: event<jsonError, unit>
  | @as("heartbeat") Heartbeat: event<unit, unit>
  | @as("login") Login: event<message<loginResponse>, string>
  | @as("setClientID") SetClientID: event<emptyMessage, string>
  | @as("requestForward") RequestForward: event<emptyMessage, string>
  | @as("receiveForward") ReceiveForward: event<message<receiveForwardResponse>, string>
  | @as("setToken") SetToken: event<emptyMessage, string>
  | @as("getDanmaku") GetDanmaku: event<message<getDanmakuResponse>, string>
  | @as("stopDanmaku") StopDanmaku: event<message<stopDanmakuResponse>, string>
  | @as("getWatchingList") GetWatchingList: event<message<getWatchingListResponse>, string>
  | @as("getBillboard") GetBillboard: event<message<getBillboardResponse>, string>
  | @as("getSummary") GetSummary: event<message<getSummaryResponse>, string>
  | @as("getLuckList") GetLuckList: event<message<getLuckListResponse>, string>
  | @as("getPlayback") GetPlayback: event<message<getPlaybackResponse>, string>
  | @as("getAllGiftList") GetAllGiftList: event<message<getAllGiftListResponse>, string>
  | @as("getWalletBalance") GetWalletBalance: event<message<getWalletBalanceResponse>, string>
  | @as("getUserLiveInfo") GetUserLiveInfo: event<message<getUserLiveInfoResponse>, string>
  | @as("getAllLiveList") GetAllLiveList: event<message<getAllLiveListResponse>, string>
  | @as("getLiveData") GetLiveData: event<message<getLiveDataResponse>, string>
  | @as("getGiftList") GetGiftList: event<message<getGiftListResponse>, string>
  | @as("getUserInfo") GetUserInfo: event<message<getUserInfoResponse>, string>
  | @as("getLiveCutInfo") GetLiveCutInfo: event<message<getLiveCutInfoResponse>, string>
  | @as("getManagerList") GetManagerList: event<message<getManagerListResponse>, string>
  | @as("addManager") AddManager: event<emptyMessage, string>
  | @as("deleteManager") DeleteManager: event<emptyMessage, string>
  | @as("getAllKickHistory") GetAllKickHistory: event<message<getAllKickHistoryResponse>, string>
  | @as("managerKick") ManagerKick: event<emptyMessage, string>
  | @as("authorKick") AuthorKick: event<emptyMessage, string>
  | @as("getMedalDetail") GetMedalDetail: event<message<getMedalDetailResponse>, string>
  | @as("getMedalList") GetMedalList: event<message<getMedalListResponse>, string>
  | @as("getMedalRankList") GetMedalRankList: event<message<getMedalRankListResponse>, string>
  | @as("getUserMedal") GetUserMedal: event<message<getUserMedalResponse>, string>
  | @as("wearMedal") WearMedal: event<emptyMessage, string>
  | @as("cancelWearMedal") CancelWearMedal: event<emptyMessage, string>
  | @as("checkLiveAuth") CheckLiveAuth: event<message<checkLiveAuthResponse>, string>
  | @as("getLiveTypeList") GetLiveTypeList: event<message<getLiveTypeListResponse>, string>
  | @as("getPushConfig") GetPushConfig: event<message<getPushConfigResponse>, string>
  | @as("getLiveStatus") GetLiveStatus: event<message<getLiveStatusResponse>, string>
  | @as("getTranscodeInfo") GetTranscodeInfo: event<message<getTranscodeInfoResponse>, string>
  | @as("startLive") StartLive: event<message<startLiveResponse>, string>
  | @as("stopLive") StopLive: event<message<stopLiveResponse>, string>
  | @as("changeTitleAndCover") ChangeTitleAndCover: event<emptyMessage, string>
  | @as("getLiveCutStatus") GetLiveCutStatus: event<message<getLiveCutStatusResponse>, string>
  | @as("setLiveCutStatus") SetLiveCutStatus: event<emptyMessage, string>
  | @as("comment") Comment: event<danmaku<comment>, int>
  | @as("like") Like: event<danmaku<like>, int>
  | @as("enterRoom") EnterRoom: event<danmaku<enterRoom>, int>
  | @as("followAuthor") FollowAuthor: event<danmaku<followAuthor>, int>
  | @as("throwBanana") ThrowBanana: event<danmaku<throwBanana>, int>
  | @as("gift") Gift: event<danmaku<gift>, int>
  | @as("richText") RichText: event<danmaku<richText>, int>
  | @as("joinClub") JoinClub: event<danmaku<joinClub>, int>
  | @as("shareLive") ShareLive: event<danmaku<shareLive>, int>
  | @as("danmakuStop") DanmakuStop: event<emptyDanmaku, int>
  | @as("bananaCount") BananaCount: event<danmaku<bananaCount>, int>
  | @as("displayInfo") DisplayInfo: event<danmaku<displayInfo>, int>
  | @as("topUsers") TopUsers: event<danmaku<topUsers>, int>
  | @as("recentComments") RecentComments: event<danmaku<recentComments>, int>
  | @as("redpackList") RedpackList: event<danmaku<redpackList>, int>
  | @as("chatCall") ChatCall: event<danmaku<chatCall>, int>
  | @as("chatAccept") ChatAccept: event<danmaku<chatAccept>, int>
  | @as("chatReady") ChatReady: event<danmaku<chatReady>, int>
  | @as("chatEnd") ChatEnd: event<danmaku<chatEnd>, int>
  | @as("danmakuStopError") DanmakuStopError: event<danmaku<danmakuStopError>, int>
  | @as("kickedOut") KickedOut: event<danmaku<kickedOut>, int>
  | @as("violationAlert") ViolationAlert: event<danmaku<violationAlert>, int>
  | @as("managerState") ManagerState: event<danmaku<managerState>, int>

type rec request<'a, 'b> =
  | @as("login") Login: request<loginRequest, message<loginResponse>>
  | @as("setClientID") SetClientID: request<setClientIDRequest, emptyMessage>
  | @as("requestForward") RequestForward: request<requestForwardRequest, emptyMessage>
  | @as("setToken") SetToken: request<setTokenRequest, emptyMessage>
  | @as("getDanmaku") GetDanmaku: request<getDanmakuRequest, message<getDanmakuResponse>>
  | @as("stopDanmaku") StopDanmaku: request<stopDanmakuRequest, message<stopDanmakuResponse>>
  | @as("getWatchingList")
  GetWatchingList: request<getWatchingListRequest, message<getWatchingListResponse>>
  | @as("getBillboard") GetBillboard: request<getBillboardRequest, message<getBillboardResponse>>
  | @as("getSummary") GetSummary: request<getSummaryRequest, message<getSummaryResponse>>
  | @as("getLuckList") GetLuckList: request<getLuckListRequest, message<getLuckListResponse>>
  | @as("getPlayback") GetPlayback: request<getPlaybackRequest, message<getPlaybackResponse>>
  | @as("getAllGiftList") GetAllGiftList: request<unit, message<getAllGiftListResponse>>
  | @as("getWalletBalance") GetWalletBalance: request<unit, message<getWalletBalanceResponse>>
  | @as("getUserLiveInfo")
  GetUserLiveInfo: request<getUserLiveInfoRequest, message<getUserLiveInfoResponse>>
  | @as("getAllLiveList") GetAllLiveList: request<unit, message<getAllLiveListResponse>>
  | @as("getLiveData") GetLiveData: request<getLiveDataRequest, message<getLiveDataResponse>>
  | @as("getGiftList") GetGiftList: request<getGiftListRequest, message<getGiftListResponse>>
  | @as("getUserInfo") GetUserInfo: request<getUserInfoRequest, message<getUserInfoResponse>>
  | @as("getLiveCutInfo")
  GetLiveCutInfo: request<getLiveCutInfoRequest, message<getLiveCutInfoResponse>>
  | @as("getManagerList") GetManagerList: request<unit, message<getManagerListResponse>>
  | @as("addManager") AddManager: request<addManagerRequest, emptyMessage>
  | @as("deleteManager") DeleteManager: request<deleteManagerRequest, emptyMessage>
  | @as("getAllKickHistory")
  GetAllKickHistory: request<getAllKickHistoryRequest, message<getAllKickHistoryResponse>>
  | @as("managerKick") ManagerKick: request<managerKickRequest, emptyMessage>
  | @as("authorKick") AuthorKick: request<authorKickRequest, emptyMessage>
  | @as("getMedalDetail")
  GetMedalDetail: request<getMedalDetailRequest, message<getMedalDetailResponse>>
  | @as("getMedalList") GetMedalList: request<unit, message<getMedalListResponse>>
  | @as("getMedalRankList")
  GetMedalRankList: request<getMedalRankListRequest, message<getMedalRankListResponse>>
  | @as("getUserMedal") GetUserMedal: request<getUserMedalRequest, message<getUserMedalResponse>>
  | @as("wearMedal") WearMedal: request<wearMedalRequest, emptyMessage>
  | @as("cancelWearMedal") CancelWearMedal: request<unit, emptyMessage>
  | @as("checkLiveAuth") CheckLiveAuth: request<unit, message<checkLiveAuthResponse>>
  | @as("getLiveTypeList") GetLiveTypeList: request<unit, message<getLiveTypeListResponse>>
  | @as("getPushConfig") GetPushConfig: request<unit, message<getPushConfigResponse>>
  | @as("getLiveStatus") GetLiveStatus: request<unit, message<getLiveStatusResponse>>
  | @as("getTranscodeInfo")
  GetTranscodeInfo: request<getTranscodeInfoRequest, message<getTranscodeInfoResponse>>
  | @as("startLive") StartLive: request<startLiveRequest, message<startLiveResponse>>
  | @as("stopLive") StopLive: request<stopLiveRequest, message<stopLiveResponse>>
  | @as("changeTitleAndCover")
  ChangeTitleAndCover: request<changeTitleAndCoverRequest, emptyMessage>
  | @as("getLiveCutStatus") GetLiveCutStatus: request<unit, message<getLiveCutStatusResponse>>
  | @as("setLiveCutStatus") SetLiveCutStatus: request<setLiveCutStatusRequest, emptyMessage>

type unsubscribe = AcLive__Subject.unsubscribe

type t = {
  connect: unit => unit,
  disconnect: unit => unit,
  isConnecting: unit => bool,
  on: 'a 'b. (
    event<'a, 'b>,
    ~onData: 'a => unit,
    ~key: 'b=?,
    ~onError: error => unit=?,
  ) => unsubscribe,
  request: 'a 'b. (request<'a, 'b>, 'a, ~requestID: string=?) => unit,
  asyncRequest: 'a 'b. (
    request<'a, 'b>,
    'a,
    ~requestIDPrefix: string=?,
    ~timeout: int=?,
  ) => promise<'b>,
}

type config = {
  websocketUrl: string,
  autoReconnect: bool,
  asyncRequestTimeout: int,
}

let defaultConfig = {
  websocketUrl: "ws://localhost:15368",
  autoReconnect: true,
  asyncRequestTimeout: 10000,
}

type subject<'a> = AcLive__Subject.t<'a>

let makeSubject = AcLive__Subject.make

let setResponse = (type a, subject: subject<response<a>>, v) =>
  v->subject.set(~key=v->getResponseRequestId)

let setEmptyResponse = (subject: subject<emptyResponse>, v) =>
  v->subject.set(~key=v->getEmptyResponseRequestId)

let setDanmaku = (type a, subject: subject<danmaku<a>>, v) =>
  v->subject.set(~key=v.liverUID->Int.toString)

let fixKeyCallback = (type a, subject: subject<a>, key, ~onData: a => unit) =>
  subject.subcribe((v, ~key as _) => onData(v), ~key)

let responseCallback = (
  type a,
  subject: subject<result<a, error>>,
  ~key=?,
  ~onData: a => unit,
  ~onError=?,
) => subject.subcribe((value, ~key as _) =>
    switch value {
    | Ok(v) => onData(v)
    | Error(e) =>
      switch onError {
      | Some(f) => f(e)
      | None => ()
      }
    }
  , ~key?)

let danmakuCallback = (type a, subject: subject<a>, ~key=?, ~onData: a => unit) =>
  subject.subcribe((v, ~key as _) => onData(v), ~key=?key->Option.map(Int.toString))

let make = (module(WebSocket: AcLive__WebSocket.WebSocket), ~config=defaultConfig) => {
  let id = ref(0)
  let ws = ref(None)
  let isReConnecting = ref(false)

  let unitSubject = makeSubject()
  let websocketErrorSubject = makeSubject()
  let jsonErrorSubject = makeSubject()
  let loginSubject = makeSubject()
  let setClientIDSubject = makeSubject()
  let requestForwardSubject = makeSubject()
  let receiveForwardSubject = makeSubject()
  let setTokenSubject = makeSubject()
  let getDanmakuSubject = makeSubject()
  let stopDanmakuSubject = makeSubject()
  let getWatchingListSubject = makeSubject()
  let getBillboardSubject = makeSubject()
  let getSummarySubject = makeSubject()
  let getLuckListSubject = makeSubject()
  let getPlaybackSubject = makeSubject()
  let getAllGiftListSubject = makeSubject()
  let getWalletBalanceSubject = makeSubject()
  let getUserLiveInfoSubject = makeSubject()
  let getAllLiveListSubject = makeSubject()
  let getLiveDataSubject = makeSubject()
  let getGiftListSubject = makeSubject()
  let getUserInfoSubject = makeSubject()
  let getLiveCutInfoSubject = makeSubject()
  let getManagerListSubject = makeSubject()
  let addManagerSubject = makeSubject()
  let deleteManagerSubject = makeSubject()
  let getAllKickHistorySubject = makeSubject()
  let managerKickSubject = makeSubject()
  let authorKickSubject = makeSubject()
  let getMedalDetailSubject = makeSubject()
  let getMedalListSubject = makeSubject()
  let getMedalRankListSubject = makeSubject()
  let getUserMedalSubject = makeSubject()
  let wearMedalSubject = makeSubject()
  let cancelWearMedalSubject = makeSubject()
  let checkLiveAuthSubject = makeSubject()
  let getLiveTypeListSubject = makeSubject()
  let getPushConfigSubject = makeSubject()
  let getLiveStatusSubject = makeSubject()
  let getTranscodeInfoSubject = makeSubject()
  let startLiveSubject = makeSubject()
  let stopLiveSubject = makeSubject()
  let changeTitleAndCoverSubject = makeSubject()
  let getLiveCutStatusSubject = makeSubject()
  let setLiveCutStatusSubject = makeSubject()
  let commentSubject = makeSubject()
  let likeSubject = makeSubject()
  let enterRoomSubject = makeSubject()
  let followAuthorSubject = makeSubject()
  let throwBananaSubject = makeSubject()
  let giftSubject = makeSubject()
  let richTextSubject = makeSubject()
  let joinClubSubject = makeSubject()
  let shareLiveSubject = makeSubject()
  let danmakuStopSubject = makeSubject()
  let bananaCountSubject = makeSubject()
  let displayInfoSubject = makeSubject()
  let topUsersSubject = makeSubject()
  let recentCommentsSubject = makeSubject()
  let redpackListSubject = makeSubject()
  let chatCallSubject = makeSubject()
  let chatAcceptSubject = makeSubject()
  let chatReadySubject = makeSubject()
  let chatEndSubject = makeSubject()
  let danmakuStopErrorStopSubject = makeSubject()
  let kickedOutSubject = makeSubject()
  let violationAlertSubject = makeSubject()
  let managerStateSubject = makeSubject()

  let uuidDict = Dict.make()

  let isConnecting = () =>
    switch ws.contents {
    | Some(w) => w->WebSocket.isOpen
    | None => false
    }

  let disconnect = () =>
    switch ws.contents {
    | Some(w) => {
        ws := None
        w->WebSocket.close
        isReConnecting := false
      }
    | None => ()
    }

  let rec connect = () => {
    if !isConnecting() && !isReConnecting.contents {
      id := id.contents + 1
      let wid = id.contents
      let w = WebSocket.make(config.websocketUrl)
      ws := Some(w)

      let heartbeatInterval = ref(None)
      let cleanupFn = ref(None)

      let cleanup = () => {
        switch heartbeatInterval.contents {
        | Some(id) => {
            id->clearInterval
            heartbeatInterval := None
          }
        | None => ()
        }

        switch cleanupFn.contents {
        | Some(fn) => {
            fn()
            cleanupFn := None
          }
        | None => ()
        }

        if wid === id.contents && ws.contents->Option.isSome {
          // 并非主动关闭
          disconnect()

          if config.autoReconnect {
            isReConnecting := true
            // 延迟5秒后重新连接
            setTimeout(() => {
              isReConnecting := false
              connect()
            }, 5000)->ignore
          }
        }
      }

      let openListener = _ => {
        heartbeatInterval := Some(setInterval(() => w->WebSocket.send(heartbeat), 5000))
        unitSubject.set((), ~key="websocketOpen")
      }
      let closeListener = _ => {
        unitSubject.set((), ~key="websocketClose")
        cleanup()
      }
      let errorListener = (e: AcLive__WebSocket.errorEvent<WebSocket.t>) => {
        websocketErrorSubject.set({error: ?e.error, message: ?e.message}, ~key="websocketError")
        // 出现错误就关闭连接重连
        cleanup()
      }

      w->WebSocket.addOpenListener(openListener)
      w->WebSocket.addCloseListener(closeListener)
      w->WebSocket.addErrorListener(errorListener)

      let messageListener = ({data}: AcLive__WebSocket.messageEvent<WebSocket.t>) => {
        switch data->parseResponse {
        | Ok(response) =>
          switch response {
          | Heartbeat => unitSubject.set((), ~key="heartbeat")
          | Login(v) => loginSubject->setResponse(v)
          | SetClientID(v) => setClientIDSubject->setEmptyResponse(v)
          | RequestForward(v) => requestForwardSubject->setEmptyResponse(v)
          | ReceiveForward(v) => receiveForwardSubject->setResponse(v)
          | SetToken(v) => setTokenSubject->setEmptyResponse(v)
          | GetDanmaku(v) => getDanmakuSubject->setResponse(v)
          | StopDanmaku(v) => stopDanmakuSubject->setResponse(v)
          | GetWatchingList(v) => getWatchingListSubject->setResponse(v)
          | GetBillboard(v) => getBillboardSubject->setResponse(v)
          | GetSummary(v) => getSummarySubject->setResponse(v)
          | GetLuckList(v) => getLuckListSubject->setResponse(v)
          | GetPlayback(v) => getPlaybackSubject->setResponse(v)
          | GetAllGiftList(v) => getAllGiftListSubject->setResponse(v)
          | GetWalletBalance(v) => getWalletBalanceSubject->setResponse(v)
          | GetUserLiveInfo(v) => getUserLiveInfoSubject->setResponse(v)
          | GetAllLiveList(v) => getAllLiveListSubject->setResponse(v)
          | GetLiveData(v) => getLiveDataSubject->setResponse(v)
          | GetGiftList(v) => getGiftListSubject->setResponse(v)
          | GetUserInfo(v) => getUserInfoSubject->setResponse(v)
          | GetLiveCutInfo(v) => getLiveCutInfoSubject->setResponse(v)
          | GetManagerList(v) => getManagerListSubject->setResponse(v)
          | AddManager(v) => addManagerSubject->setEmptyResponse(v)
          | DeleteManager(v) => deleteManagerSubject->setEmptyResponse(v)
          | GetAllKickHistory(v) => getAllKickHistorySubject->setResponse(v)
          | ManagerKick(v) => managerKickSubject->setEmptyResponse(v)
          | AuthorKick(v) => authorKickSubject->setEmptyResponse(v)
          | GetMedalDetail(v) => getMedalDetailSubject->setResponse(v)
          | GetMedalList(v) => getMedalListSubject->setResponse(v)
          | GetMedalRankList(v) => getMedalRankListSubject->setResponse(v)
          | GetUserMedal(v) => getUserMedalSubject->setResponse(v)
          | WearMedal(v) => wearMedalSubject->setEmptyResponse(v)
          | CancelWearMedal(v) => cancelWearMedalSubject->setEmptyResponse(v)
          | CheckLiveAuth(v) => checkLiveAuthSubject->setResponse(v)
          | GetLiveTypeList(v) => getLiveTypeListSubject->setResponse(v)
          | GetPushConfig(v) => getPushConfigSubject->setResponse(v)
          | GetLiveStatus(v) => getLiveStatusSubject->setResponse(v)
          | GetTranscodeInfo(v) => getTranscodeInfoSubject->setResponse(v)
          | StartLive(v) => startLiveSubject->setResponse(v)
          | StopLive(v) => stopLiveSubject->setResponse(v)
          | ChangeTitleAndCover(v) => changeTitleAndCoverSubject->setEmptyResponse(v)
          | GetLiveCutStatus(v) => getLiveCutStatusSubject->setResponse(v)
          | SetLiveCutStatus(v) => setLiveCutStatusSubject->setEmptyResponse(v)
          | Comment(v) => commentSubject->setDanmaku(v)
          | Like(v) => likeSubject->setDanmaku(v)
          | EnterRoom(v) => enterRoomSubject->setDanmaku(v)
          | FollowAuthor(v) => followAuthorSubject->setDanmaku(v)
          | ThrowBanana(v) => throwBananaSubject->setDanmaku(v)
          | Gift(v) => giftSubject->setDanmaku(v)
          | RichText(v) => richTextSubject->setDanmaku(v)
          | JoinClub(v) => joinClubSubject->setDanmaku(v)
          | ShareLive(v) => shareLiveSubject->setDanmaku(v)
          | DanmakuStop(v) => v->danmakuStopSubject.set(~key=v.liverUID->Int.toString)
          | BananaCount(v) => bananaCountSubject->setDanmaku(v)
          | DisplayInfo(v) => displayInfoSubject->setDanmaku(v)
          | TopUsers(v) => topUsersSubject->setDanmaku(v)
          | RecentComments(v) => recentCommentsSubject->setDanmaku(v)
          | RedpackList(v) => redpackListSubject->setDanmaku(v)
          | ChatCall(v) => chatCallSubject->setDanmaku(v)
          | ChatAccept(v) => chatAcceptSubject->setDanmaku(v)
          | ChatReady(v) => chatReadySubject->setDanmaku(v)
          | ChatEnd(v) => chatEndSubject->setDanmaku(v)
          | DanmakuStopError(v) => danmakuStopErrorStopSubject->setDanmaku(v)
          | KickedOut(v) => kickedOutSubject->setDanmaku(v)
          | ViolationAlert(v) => violationAlertSubject->setDanmaku(v)
          | ManagerState(v) => managerStateSubject->setDanmaku(v)
          }
        | Error(e) => jsonErrorSubject.set({json: data, error: e}, ~key="jsonError")
        }
      }

      w->WebSocket.addMessageListener(messageListener)

      cleanupFn :=
        Some(
          () => {
            w->WebSocket.removeOpenListener(openListener)
            w->WebSocket.removeCloseListener(closeListener)
            w->WebSocket.removeErrorListener(errorListener)
            w->WebSocket.removeMessageListener(messageListener)
          },
        )
    }
  }

  let on = (type a b, event: event<a, b>, ~onData: a => unit, ~key: option<b>=?, ~onError=?) =>
    switch event {
    | WebsocketOpen => unitSubject->fixKeyCallback("websocketOpen", ~onData)
    | WebsocketClose => unitSubject->fixKeyCallback("websocketClose", ~onData)
    | WebsocketError => websocketErrorSubject->fixKeyCallback("websocketError", ~onData)
    | JsonError => jsonErrorSubject->fixKeyCallback("jsonError", ~onData)
    | Heartbeat => unitSubject->fixKeyCallback("heartbeat", ~onData)
    | Login => loginSubject->responseCallback(~key?, ~onData, ~onError?)
    | SetClientID => setClientIDSubject->responseCallback(~key?, ~onData, ~onError?)
    | RequestForward => requestForwardSubject->responseCallback(~key?, ~onData, ~onError?)
    | ReceiveForward => receiveForwardSubject->responseCallback(~key?, ~onData, ~onError?)
    | SetToken => setTokenSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetDanmaku => getDanmakuSubject->responseCallback(~key?, ~onData, ~onError?)
    | StopDanmaku => stopDanmakuSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetWatchingList => getWatchingListSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetBillboard => getBillboardSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetSummary => getSummarySubject->responseCallback(~key?, ~onData, ~onError?)
    | GetLuckList => getLuckListSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetPlayback => getPlaybackSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetAllGiftList => getAllGiftListSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetWalletBalance => getWalletBalanceSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetUserLiveInfo => getUserLiveInfoSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetAllLiveList => getAllLiveListSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetLiveData => getLiveDataSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetGiftList => getGiftListSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetUserInfo => getUserInfoSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetLiveCutInfo => getLiveCutInfoSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetManagerList => getManagerListSubject->responseCallback(~key?, ~onData, ~onError?)
    | AddManager => addManagerSubject->responseCallback(~key?, ~onData, ~onError?)
    | DeleteManager => deleteManagerSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetAllKickHistory => getAllKickHistorySubject->responseCallback(~key?, ~onData, ~onError?)
    | ManagerKick => managerKickSubject->responseCallback(~key?, ~onData, ~onError?)
    | AuthorKick => authorKickSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetMedalDetail => getMedalDetailSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetMedalList => getMedalListSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetMedalRankList => getMedalRankListSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetUserMedal => getUserMedalSubject->responseCallback(~key?, ~onData, ~onError?)
    | WearMedal => wearMedalSubject->responseCallback(~key?, ~onData, ~onError?)
    | CancelWearMedal => cancelWearMedalSubject->responseCallback(~key?, ~onData, ~onError?)
    | CheckLiveAuth => checkLiveAuthSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetLiveTypeList => getLiveTypeListSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetPushConfig => getPushConfigSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetLiveStatus => getLiveStatusSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetTranscodeInfo => getTranscodeInfoSubject->responseCallback(~key?, ~onData, ~onError?)
    | StartLive => startLiveSubject->responseCallback(~key?, ~onData, ~onError?)
    | StopLive => stopLiveSubject->responseCallback(~key?, ~onData, ~onError?)
    | ChangeTitleAndCover => changeTitleAndCoverSubject->responseCallback(~key?, ~onData, ~onError?)
    | GetLiveCutStatus => getLiveCutStatusSubject->responseCallback(~key?, ~onData, ~onError?)
    | SetLiveCutStatus => setLiveCutStatusSubject->responseCallback(~key?, ~onData, ~onError?)
    | Comment => commentSubject->danmakuCallback(~key?, ~onData)
    | Like => likeSubject->danmakuCallback(~key?, ~onData)
    | EnterRoom => enterRoomSubject->danmakuCallback(~key?, ~onData)
    | FollowAuthor => followAuthorSubject->danmakuCallback(~key?, ~onData)
    | ThrowBanana => throwBananaSubject->danmakuCallback(~key?, ~onData)
    | Gift => giftSubject->danmakuCallback(~key?, ~onData)
    | RichText => richTextSubject->danmakuCallback(~key?, ~onData)
    | JoinClub => joinClubSubject->danmakuCallback(~key?, ~onData)
    | ShareLive => shareLiveSubject->danmakuCallback(~key?, ~onData)
    | DanmakuStop => danmakuStopSubject->danmakuCallback(~key?, ~onData)
    | BananaCount => bananaCountSubject->danmakuCallback(~key?, ~onData)
    | DisplayInfo => displayInfoSubject->danmakuCallback(~key?, ~onData)
    | TopUsers => topUsersSubject->danmakuCallback(~key?, ~onData)
    | RecentComments => recentCommentsSubject->danmakuCallback(~key?, ~onData)
    | RedpackList => redpackListSubject->danmakuCallback(~key?, ~onData)
    | ChatCall => chatCallSubject->danmakuCallback(~key?, ~onData)
    | ChatAccept => chatAcceptSubject->danmakuCallback(~key?, ~onData)
    | ChatReady => chatReadySubject->danmakuCallback(~key?, ~onData)
    | ChatEnd => chatEndSubject->danmakuCallback(~key?, ~onData)
    | DanmakuStopError => danmakuStopErrorStopSubject->danmakuCallback(~key?, ~onData)
    | KickedOut => kickedOutSubject->danmakuCallback(~key?, ~onData)
    | ViolationAlert => violationAlertSubject->danmakuCallback(~key?, ~onData)
    | ManagerState => managerStateSubject->danmakuCallback(~key?, ~onData)
    }

  let sendRequest = (data, ws) =>
    switch data->serializeRequest {
    | Ok(d) => ws->WebSocket.send(d)
    | Error(e) => jsonErrorSubject.set({error: e}, ~key="jsonError")
    }

  let request = (type a b, request: request<a, b>, data: a, ~requestID=?) =>
    switch ws.contents {
    | Some(w) =>
      switch request {
      | Login => Login(data->makeMessage(~requestID?))->sendRequest(w)
      | SetClientID => SetClientID(data->makeMessage(~requestID?))->sendRequest(w)
      | RequestForward => RequestForward(data->makeMessage(~requestID?))->sendRequest(w)
      | SetToken => SetToken(data->makeMessage(~requestID?))->sendRequest(w)
      | GetDanmaku => GetDanmaku(data->makeMessage(~requestID?))->sendRequest(w)
      | StopDanmaku => StopDanmaku(data->makeMessage(~requestID?))->sendRequest(w)
      | GetWatchingList => GetWatchingList(data->makeMessage(~requestID?))->sendRequest(w)
      | GetBillboard => GetBillboard(data->makeMessage(~requestID?))->sendRequest(w)
      | GetSummary => GetSummary(data->makeMessage(~requestID?))->sendRequest(w)
      | GetLuckList => GetLuckList(data->makeMessage(~requestID?))->sendRequest(w)
      | GetPlayback => GetPlayback(data->makeMessage(~requestID?))->sendRequest(w)
      | GetAllGiftList => GetAllGiftList(makeEmptyMessage(~requestID?))->sendRequest(w)
      | GetWalletBalance => GetWalletBalance(makeEmptyMessage(~requestID?))->sendRequest(w)
      | GetUserLiveInfo => GetUserLiveInfo(data->makeMessage(~requestID?))->sendRequest(w)
      | GetAllLiveList => GetAllLiveList(makeEmptyMessage(~requestID?))->sendRequest(w)
      | GetLiveData => GetLiveData(data->makeMessage(~requestID?))->sendRequest(w)
      | GetGiftList => GetGiftList(data->makeMessage(~requestID?))->sendRequest(w)
      | GetUserInfo => GetUserInfo(data->makeMessage(~requestID?))->sendRequest(w)
      | GetLiveCutInfo => GetLiveCutInfo(data->makeMessage(~requestID?))->sendRequest(w)
      | GetManagerList => GetManagerList(makeEmptyMessage(~requestID?))->sendRequest(w)
      | AddManager => AddManager(data->makeMessage(~requestID?))->sendRequest(w)
      | DeleteManager => DeleteManager(data->makeMessage(~requestID?))->sendRequest(w)
      | GetAllKickHistory => GetAllKickHistory(data->makeMessage(~requestID?))->sendRequest(w)
      | ManagerKick => ManagerKick(data->makeMessage(~requestID?))->sendRequest(w)
      | AuthorKick => AuthorKick(data->makeMessage(~requestID?))->sendRequest(w)
      | GetMedalDetail => GetMedalDetail(data->makeMessage(~requestID?))->sendRequest(w)
      | GetMedalList => GetMedalList(makeEmptyMessage(~requestID?))->sendRequest(w)
      | GetMedalRankList => GetMedalRankList(data->makeMessage(~requestID?))->sendRequest(w)
      | GetUserMedal => GetUserMedal(data->makeMessage(~requestID?))->sendRequest(w)
      | WearMedal => WearMedal(data->makeMessage(~requestID?))->sendRequest(w)
      | CancelWearMedal => CancelWearMedal(makeEmptyMessage(~requestID?))->sendRequest(w)
      | CheckLiveAuth => CheckLiveAuth(makeEmptyMessage(~requestID?))->sendRequest(w)
      | GetLiveTypeList => GetLiveTypeList(makeEmptyMessage(~requestID?))->sendRequest(w)
      | GetPushConfig => GetPushConfig(makeEmptyMessage(~requestID?))->sendRequest(w)
      | GetLiveStatus => GetLiveStatus(makeEmptyMessage(~requestID?))->sendRequest(w)
      | GetTranscodeInfo => GetTranscodeInfo(data->makeMessage(~requestID?))->sendRequest(w)
      | StartLive => StartLive(data->makeMessage(~requestID?))->sendRequest(w)
      | StopLive => StopLive(data->makeMessage(~requestID?))->sendRequest(w)
      | ChangeTitleAndCover => ChangeTitleAndCover(data->makeMessage(~requestID?))->sendRequest(w)
      | GetLiveCutStatus => GetLiveCutStatus(makeEmptyMessage(~requestID?))->sendRequest(w)
      | SetLiveCutStatus => SetLiveCutStatus(data->makeMessage(~requestID?))->sendRequest(w)
      }
    | None => ()
    }

  // 避免UUID重复，虽然重复可能性极低
  let rec generateUuid = () => {
    let uuid = AcLive__Utils.uuidv4()
    switch uuidDict->Dict.get(uuid) {
    | Some(_) => generateUuid()
    | None => {
        uuidDict->Dict.set(uuid, 0)
        (uuid, () => uuidDict->Dict.delete(uuid))
      }
    }
  }

  let asyncRequest = (
    type a b,
    request: request<a, b>,
    data: a,
    ~requestIDPrefix=?,
    ~timeout=?,
  ): promise<b> => {
    let makePromise = (f: (b => unit, exn => unit) => unit) => Promise.make(f)

    switch ws.contents {
    | Some(w) =>
      makePromise((resolve, reject) => {
        let (uuid, deleteUuid) = generateUuid()
        let requestID = requestIDPrefix->Option.getWithDefault("") ++ "#" ++ uuid
        let unsubscribe = ref(None)
        let timeout = setTimeout(() => {
          switch unsubscribe.contents {
          | Some(f) => {
              f()
              unsubscribe := None
            }
          | None => ()
          }
          deleteUuid()
          reject(AsyncRequestTimeout)
        }, timeout->Option.getWithDefault(config.asyncRequestTimeout))

        let handleEmptyMessage = (subject: subject<result<b, error>>, constructor) => {
          constructor(makeEmptyMessage(~requestID))->sendRequest(w)
          unsubscribe := Some(subject.oneshot((value, ~key as _) => {
                timeout->clearTimeout
                deleteUuid()
                switch value {
                | Ok(v) => resolve(v)
                | Error(e) => reject(ResponseError(e))
                }
              }, ~key=requestID))
        }

        let handleMessage = (subject: subject<result<b, error>>, constructor) => {
          constructor(data->makeMessage(~requestID))->sendRequest(w)
          unsubscribe := Some(subject.oneshot((value, ~key as _) => {
                timeout->clearTimeout
                deleteUuid()
                switch value {
                | Ok(v) => resolve(v)
                | Error(e) => reject(ResponseError(e))
                }
              }, ~key=requestID))
        }

        switch request {
        | Login => loginSubject->handleMessage(v => Login(v))
        | SetClientID => setClientIDSubject->handleMessage(v => SetClientID(v))
        | RequestForward => requestForwardSubject->handleMessage(v => RequestForward(v))
        | SetToken => setTokenSubject->handleMessage(v => SetToken(v))
        | GetDanmaku => getDanmakuSubject->handleMessage(v => GetDanmaku(v))
        | StopDanmaku => stopDanmakuSubject->handleMessage(v => StopDanmaku(v))
        | GetWatchingList => getWatchingListSubject->handleMessage(v => GetWatchingList(v))
        | GetBillboard => getBillboardSubject->handleMessage(v => GetBillboard(v))
        | GetSummary => getSummarySubject->handleMessage(v => GetSummary(v))
        | GetLuckList => getLuckListSubject->handleMessage(v => GetLuckList(v))
        | GetPlayback => getPlaybackSubject->handleMessage(v => GetPlayback(v))
        | GetAllGiftList => getAllGiftListSubject->handleEmptyMessage(v => GetAllGiftList(v))
        | GetWalletBalance => getWalletBalanceSubject->handleEmptyMessage(v => GetWalletBalance(v))
        | GetUserLiveInfo => getUserLiveInfoSubject->handleMessage(v => GetUserLiveInfo(v))
        | GetAllLiveList => getAllLiveListSubject->handleEmptyMessage(v => GetAllLiveList(v))
        | GetLiveData => getLiveDataSubject->handleMessage(v => GetLiveData(v))
        | GetGiftList => getGiftListSubject->handleMessage(v => GetGiftList(v))
        | GetUserInfo => getUserInfoSubject->handleMessage(v => GetUserInfo(v))
        | GetLiveCutInfo => getLiveCutInfoSubject->handleMessage(v => GetLiveCutInfo(v))
        | GetManagerList => getManagerListSubject->handleEmptyMessage(v => GetManagerList(v))
        | AddManager => addManagerSubject->handleMessage(v => AddManager(v))
        | DeleteManager => deleteManagerSubject->handleMessage(v => DeleteManager(v))
        | GetAllKickHistory => getAllKickHistorySubject->handleMessage(v => GetAllKickHistory(v))
        | ManagerKick => managerKickSubject->handleMessage(v => ManagerKick(v))
        | AuthorKick => authorKickSubject->handleMessage(v => AuthorKick(v))
        | GetMedalDetail => getMedalDetailSubject->handleMessage(v => GetMedalDetail(v))
        | GetMedalList => getMedalListSubject->handleEmptyMessage(v => GetMedalList(v))
        | GetMedalRankList => getMedalRankListSubject->handleMessage(v => GetMedalRankList(v))
        | GetUserMedal => getUserMedalSubject->handleMessage(v => GetUserMedal(v))
        | WearMedal => wearMedalSubject->handleMessage(v => WearMedal(v))
        | CancelWearMedal => cancelWearMedalSubject->handleEmptyMessage(v => CancelWearMedal(v))
        | CheckLiveAuth => checkLiveAuthSubject->handleEmptyMessage(v => CheckLiveAuth(v))
        | GetLiveTypeList => getLiveTypeListSubject->handleEmptyMessage(v => GetLiveTypeList(v))
        | GetPushConfig => getPushConfigSubject->handleEmptyMessage(v => GetPushConfig(v))
        | GetLiveStatus => getLiveStatusSubject->handleEmptyMessage(v => GetLiveStatus(v))
        | GetTranscodeInfo => getTranscodeInfoSubject->handleMessage(v => GetTranscodeInfo(v))
        | StartLive => startLiveSubject->handleMessage(v => StartLive(v))
        | StopLive => stopLiveSubject->handleMessage(v => StopLive(v))
        | ChangeTitleAndCover =>
          changeTitleAndCoverSubject->handleMessage(v => ChangeTitleAndCover(v))
        | GetLiveCutStatus => getLiveCutStatusSubject->handleEmptyMessage(v => GetLiveCutStatus(v))
        | SetLiveCutStatus => setLiveCutStatusSubject->handleMessage(v => SetLiveCutStatus(v))
        }
      })
    | None => Promise.reject(NotConnectBackend)
    }
  }

  {
    connect,
    disconnect,
    isConnecting,
    on,
    request,
    asyncRequest,
  }
}
