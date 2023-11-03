open AcLive__Message

exception NotConnectBackend
exception AsyncRequestTimeout
exception ResponseError(error)

@genType
type websocketError = {
  error?: Js.Exn.t,
  message?: string,
}

@genType
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
  disConnect: unit => unit,
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

@genType
type config = {
  websocketUrl: string,
  autoReconnect: bool,
  asyncRequestTimeout: int,
}

let make: (module(AcLive__WebSocket.WebSocket), ~config: config=?) => t
