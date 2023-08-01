let heartbeat = "{\"type\":1}"

type requestType =
  | @as(2) Login
  | @as(3) SetClientID
  | @as(4) RequestForward
  | @as(6) SetToken
  | @as(100) GetDanmaku
  | @as(101) StopDanmaku
  | @as(102) GetWatchingList
  | @as(103) GetBillboard
  | @as(104) GetSummary
  | @as(105) GetLuckList
  | @as(106) GetPlayback
  | @as(107) GetAllGiftList
  | @as(108) GetWalletBalance
  | @as(109) GetUserLiveInfo
  | @as(110) GetAllLiveList
  | @as(112) GetLiveData
  | @as(114) GetGiftList
  | @as(115) GetUserInfo
  | @as(116) GetLiveCutInfo
  | @as(200) GetManagerList
  | @as(201) AddManager
  | @as(202) DeleteManager
  | @as(203) GetAllKickHistory
  | @as(204) ManagerKick
  | @as(205) AuthorKick
  | @as(300) GetMedalDetail
  | @as(301) GetMedalList
  | @as(302) GetMedalRankList
  | @as(303) GetUserMedal
  | @as(304) WearMedal
  | @as(305) CancelWearMedal
  | @as(900) CheckLiveAuth
  | @as(901) GetLiveTypeList
  | @as(902) GetPushConfig
  | @as(903) GetLiveStatus
  | @as(904) GetTranscodeInfo
  | @as(905) StartLive
  | @as(906) StopLive
  | @as(907) ChangeTitleAndCover
  | @as(908) GetLiveCutStatus
  | @as(909) SetLiveCutStatus

external requestTypeToInt: requestType => int = "%identity"

type responseType =
  | ...requestType
  | @as(1) Heartbeat
  | @as(5) ReceiveForward
  | @as(1000) Comment
  | @as(1001) Like
  | @as(1002) EnterRoom
  | @as(1003) FollowAuthor
  | @as(1004) ThrowBanana
  | @as(1005) Gift
  | @as(1006) RichText
  | @as(1007) JoinClub
  | @as(1008) ShareLive
  | @as(2000) DanmakuStop
  | @as(2001) BananaCount
  | @as(2002) DisplayInfo
  | @as(2003) TopUsers
  | @as(2004) RecentComments
  | @as(2005) RedpackList
  | @as(2100) ChatCall
  | @as(2101) ChatAccept
  | @as(2102) ChatReady
  | @as(2103) ChatEnd
  | @as(2999) DanmakuStopError
  | @as(3000) KickedOut
  | @as(3001) ViolationAlert
  | @as(3002) ManagerState
  | UnknownResponse(int)

%%private(external intToResponseTypeUnsafe: int => responseType = "%identity")

let intToResponseType = i =>
  switch i {
  | 1
  | 2
  | 3
  | 4
  | 5
  | 6
  | 100
  | 101
  | 102
  | 103
  | 104
  | 105
  | 106
  | 107
  | 108
  | 109
  | 110
  | 112
  | 114
  | 115
  | 116
  | 200
  | 201
  | 202
  | 203
  | 204
  | 205
  | 300
  | 301
  | 302
  | 303
  | 304
  | 305
  | 900
  | 901
  | 902
  | 903
  | 904
  | 905
  | 906
  | 907
  | 908
  | 909
  | 1000
  | 1001
  | 1002
  | 1003
  | 1004
  | 1005
  | 1006
  | 1007
  | 1008
  | 2000
  | 2001
  | 2002
  | 2003
  | 2004
  | 2005
  | 2100
  | 2101
  | 2102
  | 2103
  | 2999
  | 3000
  | 3001
  | 3002 =>
    i->intToResponseTypeUnsafe
  | n => UnknownResponse(n)
  }

@genType
type responseResult =
  | Success
  | JsonParseError
  | InvalidRequestType
  | InvalidRequestData
  | HandleRequestError
  | NeedLogin
  | UnknownResult(int)

let intToResponseResult = i =>
  switch i {
  | 1 => Success
  | 10 => JsonParseError
  | 11 => InvalidRequestType
  | 12 => InvalidRequestData
  | 13 => HandleRequestError
  | 14 => NeedLogin
  | n => UnknownResult(n)
  }

@genType
type message<'a> = {
  requestID: string,
  data: 'a,
}

let makeMessage = (data, ~requestID="") => {requestID, data}

@genType
type emptyMessage = {requestID: string}

let makeEmptyMessage = (~requestID="") => {requestID: requestID}

@genType
type optionalMessage<'a> = {
  requestID: string,
  data?: 'a,
}

@genType
type error = {
  requestID: string,
  result: responseResult,
  error: string,
}

type response<'a> = Result.t<message<'a>, error>

let getResponseRequestId = (response: response<'a>) =>
  switch response {
  | Ok(v) => v.requestID
  | Error(e) => e.requestID
  }

type emptyResponse = Result.t<emptyMessage, error>

let getEmptyResponseRequestId = (response: emptyResponse) =>
  switch response {
  | Ok(v) => v.requestID
  | Error(e) => e.requestID
  }

type optionalResponse<'a> = Result.t<optionalMessage<'a>, error>

let getOptionalResponseRequestId = (response: optionalResponse<'a>) =>
  switch response {
  | Ok(v) => v.requestID
  | Error(e) => e.requestID
  }

@genType
type danmaku<'a> = {
  liverUID: int,
  data: 'a,
}

@genType
type emptyDanmaku = {liverUID: int}

@genType
type loginRequest = {
  account: string,
  password: string,
}

@genType
type tokenInfo = {
  userID: float,
  securityKey: string,
  serviceToken: string,
  deviceID: string,
  cookies: array<string>,
}

@genType
type loginResponse = tokenInfo

@genType
type setClientIDRequest = {clientID: string}

@genType
type forwardData = {
  clientID: string,
  message: string,
}

@genType
type requestForwardRequest = forwardData

@genType
type receiveForwardResponse = forwardData

@genType
type setTokenRequest = tokenInfo

@genType
type liverUID = {liverUID: int}

@genType
type getDanmakuRequest = liverUID

@genType
type streamURL = {
  url: string,
  bitrate: int,
  qualityType: string,
  qualityName: string,
}

@genType
type streamInfo = {
  liveID: string,
  title: string,
  liveStartTime: float,
  panoramic: bool,
  streamList: array<streamURL>,
  streamName: string,
}

@genType
type getDanmakuResponse = streamInfo

@genType
type stopDanmakuRequest = liverUID

@genType
type liveID = {liveID: string}

@genType
type getWatchingListRequest = liveID

@genType
type medalInfo = {
  uperID: int,
  userID: int,
  clubName: string,
  level: int,
}

@genType
type managerType = NotManager | NormalManager | UnknownManagerType(int)

let intToManagerType = i =>
  switch i {
  | 0 => NotManager
  | 1 => NormalManager
  | n => UnknownManagerType(n)
  }

@genType
type userInfo = {
  userID: float,
  nickname: string,
  avatar: string,
  medal: medalInfo,
  managerType: managerType,
}

@genType
type watchingUser = {
  userInfo: userInfo,
  anonymousUser: bool,
  displaySendAmount: string,
  customData: string,
}

@genType
type getWatchingListResponse = array<watchingUser>

@genType
type getBillboardRequest = liverUID

@genType
type getBillboardResponse = array<watchingUser>

@genType
type getSummaryRequest = liveID

@genType
type getSummaryResponse = {
  duration: int,
  likeCount: string,
  watchCount: string,
  giftCount: int,
  diamondCount: int,
  bananaCount: int,
}

@genType
type getLuckListRequest = {
  liveID: string,
  redpackID: string,
  redpackBizUnit: string,
}

@genType
type luckyUser = {
  userInfo: userInfo,
  grabAmount: int,
}

@genType
type getLuckListResponse = array<luckyUser>

@genType
type getPlaybackRequest = liveID

@genType
type getPlaybackResponse = {
  duration: int,
  url: string,
  backupURL: string,
  m3u8Slice: string,
  width: int,
  height: int,
}

@genType
type giftPayType = FreeGift | NonFreeGift | UnknownGiftPayType(int)

let intToGiftPayType = i =>
  switch i {
  | 1 => NonFreeGift
  | 2 => FreeGift
  | n => UnknownGiftPayType(n)
  }

@genType
type giftDetail = {
  giftID: int,
  giftName: string,
  arLiveName: string,
  payWalletType: giftPayType,
  price: int,
  webpPic: string,
  pngPic: string,
  smallPngPic: string,
  allowBatchSendSizeList?: array<int>,
  canCombo: bool,
  canDraw: bool,
  magicFaceID: int,
  vupArID: int,
  description: string,
  redpackPrice: int,
  cornerMarkerText: string,
}

@genType
type getAllGiftListResponse = array<giftDetail>

@genType
type getWalletBalanceResponse = {
  acCoin: int,
  banana: int,
}

@genType
type userID = {userID: int}

@genType
type getUserLiveInfoRequest = userID

@genType
type userProfile = {
  userID: int,
  nickname: string,
  avatar: string,
  avatarFrame: string,
  followingCount: int,
  fansCount: int,
  contributeCount: int,
  signature: string,
  verifiedText: string,
  isJoinUpCollege: bool,
  isFollowing: bool,
  isFollowed: bool,
}

@genType
type liveType = {
  categoryID: int,
  categoryName: string,
  subCategoryID: int,
  subCategoryName: string,
}

@genType
type userLiveInfo = {
  profile: userProfile,
  liveType: liveType,
  liveID: string,
  streamName: string,
  title: string,
  liveStartTime: float,
  portrait: bool,
  panoramic: bool,
  liveCover: string,
  onlineCount: int,
  likeCount: int,
  hasFansClub: bool,
  disableDanmakuShow: bool,
  paidShowUserBuyStatus: bool,
}

@genType
type getUserLiveInfoResponse = userLiveInfo

@genType
type getAllLiveListResponse = array<userLiveInfo>

@genType
type getLiveDataRequest = {days: int}

@genType
type liveStat = {
  duration: int,
  maxPopularityValue: int,
  watchCount: int,
  diamondCount: int,
  commentCount: int,
  bananaCount: int,
}

@genType
type liveDetail = {
  liveStartTime: float,
  liveEndTime: float,
  liveStat: liveStat,
}

@genType
type dailyData = {
  date: string,
  liveTimes: int,
  liveStat: liveStat,
}

@genType
type getLiveDataResponse = {
  beginDate: string,
  endDate: string,
  overview: liveStat,
  liveDetail: Js.Dict.t<liveDetail>,
  dailyData: array<dailyData>,
}

@genType
type getGiftListRequest = liveID

@genType
type getGiftListResponse = array<giftDetail>

@genType
type getUserInfoRequest = userID

@genType
type getUserInfoResponse = {
  userID: int,
  nickname: string,
  avatar: string,
  avatarFrame: string,
  followingCount: string,
  fansCount: string,
  contributeCount: string,
  signature: string,
  verifiedText: string,
  isJoinUpCollege: bool,
  isFollowing: bool,
  isFollowed: bool,
  liveID: string,
  likeCount: int,
}

@genType
type getLiveCutInfoRequest = {
  liverUID: int,
  liveID: string,
}

@genType
type getLiveCutInfoResponse = {
  status: bool,
  url: string,
  redirectURL: string,
}

@genType
type manager = {
  userInfo: userInfo,
  customData: string,
  online: bool,
}

@genType
type getManagerListResponse = array<manager>

@genType
type managerUID = {managerUID: int}

@genType
type addManagerRequest = managerUID

@genType
type deleteManagerRequest = managerUID

@genType
type getAllKickHistoryRequest = liveID

@genType
type kickHistory = {
  userID: int,
  nickname: string,
  kickTime: float,
}

@genType
type getAllKickHistoryResponse = array<kickHistory>

@genType
type kickUser = {
  liveID: string,
  kickedUID: int,
}

@genType
type managerKickRequest = kickUser

@genType
type authorKickRequest = kickUser

@genType
type getMedalDetailRequest = liverUID

@genType
type medal = {
  medalInfo: medalInfo,
  uperName: string,
  uperAvatar: string,
  wearMedal: bool,
  friendshipDegree: int,
  joinClubTime: float,
  currentDegreeLimit: int,
  medalCount: int,
}

@genType
type medalDegree = {
  uperID: int,
  giftDegree: int,
  giftDegreeLimit: int,
  peachDegree: int,
  peachDegreeLimit: int,
  liveWatchDegree: int,
  liveWatchDegreeLimit: int,
  bananaDegree: int,
  bananaDegreeLimit: int,
}

@genType
type getMedalDetailResponse = {
  medal: medal,
  medalDegree: medalDegree,
  userRank: string,
}

@genType
type getMedalListResponse = array<medal>

@genType
type getMedalRankListRequest = liverUID

@genType
type userMedalInfo = {
  profile: userProfile,
  friendshipDegree: int,
  level: int,
}

@genType
type getMedalRankListResponse = {
  hasFansClub: bool,
  rankList: array<userMedalInfo>,
  clubName: string,
  medalCount: int,
  hasMedal: bool,
  userFriendshipDegree: int,
  userRank: string,
}

@genType
type getUserMedalRequest = userID

@genType
type getUserMedalResponse = medal

@genType
type wearMedalRequest = liverUID

@genType
type checkLiveAuthResponse = {liveAuth: bool}

@genType
type getLiveTypeListResponse = liveType

@genType
type getPushConfigResponse = {
  streamName: string,
  streamPullAddress: string,
  streamPushAddress: array<string>,
  panoramic: bool,
  interval: int,
  rtmpServer: string,
  streamKey: string,
}

@genType
type getLiveStatusResponse = {
  liveID: string,
  streamName: string,
  title: string,
  liveCover: string,
  liveStartTime: float,
  panoramic: bool,
  bizUnit: string,
  bizCustomData: string,
}

@genType
type getTranscodeInfoRequest = {streamName: string}

@genType
type transcodeInfo = {
  streamURL: streamURL,
  resolution: string,
  frameRate: int,
  template: string,
}

@genType
type getTranscodeInfoResponse = array<transcodeInfo>

@genType
type startLiveRequest = {
  title: string,
  coverFile: string,
  streamName: string,
  portrait: bool,
  panoramic: bool,
  categoryID: int,
  subCategoryID: int,
}

@genType
type startLiveResponse = liveID

@genType
type stopLiveRequest = liveID

@genType
type stopLiveResponse = {
  duration: int,
  endReason: string,
}

@genType
type changeTitleAndCoverRequest = {
  title: string,
  coverFile: string,
  liveID: string,
}

@genType
type canCutLive = {canCut: bool}

@genType
type getLiveCutStatusResponse = canCutLive

@genType
type setLiveCutStatusRequest = canCutLive

@genType
type danmuInfo = {
  sendTime: float,
  userInfo: userInfo,
}

@genType
type comment = {
  danmuInfo: danmuInfo,
  content: string,
}

@genType
type like = danmuInfo

@genType
type enterRoom = danmuInfo

@genType
type followAuthor = danmuInfo

@genType
type throwBanana = {
  danmuInfo: danmuInfo,
  bananaCount: int,
}

@genType
type drawPoint = {
  marginLeft: int,
  marginTop: int,
  scaleRatio: int,
  handup: bool,
  pointWidth: int,
  pointHeight: int,
}

@genType
type drawGiftInfo = {
  screenWidth: int,
  screenHeight: int,
  drawPoint?: array<drawPoint>,
}

@genType
type gift = {
  danmuInfo: danmuInfo,
  giftDetail: giftDetail,
  count: int,
  combo: int,
  value: int,
  comboID: string,
  slotDisplayDuration: int,
  expireDuration: int,
  drawGiftInfo: drawGiftInfo,
}

@genType
type richTextUserInfo = {
  userInfo: userInfo,
  color: string,
}

@genType
type richTextPlain = {
  text: string,
  color: string,
}

@genType
type richTextImage = {
  pictures: array<string>,
  alternativeText: string,
  alternativeColor: string,
}

@genType @tag("type")
type richTextSegment =
  | UserInfo({segment: richTextUserInfo})
  | Plain({segment: richTextPlain})
  | Image({segment: richTextImage})

@genType
type richText = {
  sendTime: float,
  segments: array<richTextSegment>,
}

@genType
type joinClub = {
  joinTime: float,
  fansInfo: userInfo,
  uperInfo: userInfo,
}

@genType
type sharePlatformType =
  QQ | Qzone | Weibo | WeChat | WeChatMoments | AcFunMoment | UnknownPlatform(int)

let intToSharePlatformType = i =>
  switch i {
  | 1 => QQ
  | 2 => Qzone
  | 3 => Weibo
  | 4 => WeChat
  | 5 => WeChatMoments
  | 6 => AcFunMoment
  | n => UnknownPlatform(n)
  }

@genType
type shareLive = {
  danmuInfo: danmuInfo,
  sharePlatform: sharePlatformType,
  sharePlatformIcon: string,
}

@genType
type bananaCount = {bananaCount: string}

@genType
type displayInfo = {
  watchingCount: string,
  likeCount: string,
  likeDelta: int,
}

@genType
type topUsers = array<watchingUser>

@genType
type recentComments = array<comment>

@genType
type redpackDisplayStatus =
  RedpackShow | RedpackGetToken | RedpackGrab | UnknownRedpackDisplayStatus(int)

let intToRedpackDisplayStatus = i =>
  switch i {
  | 0 => RedpackShow
  | 1 => RedpackGetToken
  | 2 => RedpackGrab
  | n => UnknownRedpackDisplayStatus(n)
  }

@genType
type redpack = {
  userInfo: userInfo,
  displayStatus: redpackDisplayStatus,
  grabBeginTime: float,
  getTokenLatestTime: float,
  redpackID: string,
  redpackBizUnit: string,
  redpackAmount: int,
  settleBeginTime: float,
}

@genType
type redpackList = array<redpack>

@genType
type chatCall = {
  chatID: string,
  liveID: string,
  callTime: float,
}

@genType
type chatMediaType = Audio | Video | UnknownChatMediaType(int)

let intToChatMediaType = i =>
  switch i {
  | 1 => Audio
  | 2 => Video
  | n => UnknownChatMediaType(n)
  }

@genType
type chatAccept = {
  chatID: string,
  mediaType: chatMediaType,
  signalInfo: string,
}

@genType
type chatReady = {
  chatID: string,
  guest: userInfo,
  mediaType: chatMediaType,
}

@genType
type chatEndType =
  | CancelByAuthor
  | EndByAuthor
  | EndByGuest
  | GuestReject
  | GuestTimeout
  | GuestHeartbeatTimeout
  | AuthorHeartbeatTimeout
  | PeerLiveStopped
  | UnknownChatEndType(int)

let intToChatEndType = i =>
  switch i {
  | 1 => CancelByAuthor
  | 2 => EndByAuthor
  | 3 => EndByGuest
  | 4 => GuestReject
  | 5 => GuestTimeout
  | 6 => GuestHeartbeatTimeout
  | 7 => AuthorHeartbeatTimeout
  | 8 => PeerLiveStopped
  | n => UnknownChatEndType(n)
  }

@genType
type chatEnd = {
  chatID: string,
  endType: chatEndType,
}

@genType
type danmakuStopError = {error: string}

@genType
type kickedOut = {kickedOutReason: string}

@genType
type violationAlert = {violationContent: string}

@genType
type managerStateType =
  NotManager | ManagerAdded | ManagerRemoved | IsManager | UnknownManagerStateType(int)

let intToManagerStateType = i =>
  switch i {
  | 0 => NotManager
  | 1 => ManagerAdded
  | 2 => ManagerRemoved
  | 3 => IsManager
  | n => UnknownManagerStateType(n)
  }

@genType
type managerState = {managerState: managerStateType}

type requestData =
  | @as(2) Login(message<loginRequest>)
  | @as(3) SetClientID(message<setClientIDRequest>)
  | @as(4) RequestForward(message<requestForwardRequest>)
  | @as(6) SetToken(message<setTokenRequest>)
  | @as(100) GetDanmaku(message<getDanmakuRequest>)
  | @as(101) StopDanmaku(message<stopDanmakuRequest>)
  | @as(102) GetWatchingList(message<getWatchingListRequest>)
  | @as(103) GetBillboard(message<getBillboardRequest>)
  | @as(104) GetSummary(message<getSummaryRequest>)
  | @as(105) GetLuckList(message<getLuckListRequest>)
  | @as(106) GetPlayback(message<getPlaybackRequest>)
  | @as(107) GetAllGiftList(emptyMessage)
  | @as(108) GetWalletBalance(emptyMessage)
  | @as(109) GetUserLiveInfo(message<getUserLiveInfoRequest>)
  | @as(110) GetAllLiveList(emptyMessage)
  | @as(112) GetLiveData(message<getLiveDataRequest>)
  | @as(114) GetGiftList(message<getGiftListRequest>)
  | @as(115) GetUserInfo(message<getUserInfoRequest>)
  | @as(116) GetLiveCutInfo(message<getLiveCutInfoRequest>)
  | @as(200) GetManagerList(emptyMessage)
  | @as(201) AddManager(message<addManagerRequest>)
  | @as(202) DeleteManager(message<deleteManagerRequest>)
  | @as(203) GetAllKickHistory(message<getAllKickHistoryRequest>)
  | @as(204) ManagerKick(message<managerKickRequest>)
  | @as(205) AuthorKick(message<authorKickRequest>)
  | @as(300) GetMedalDetail(message<getMedalDetailRequest>)
  | @as(301) GetMedalList(emptyMessage)
  | @as(302) GetMedalRankList(message<getMedalRankListRequest>)
  | @as(303) GetUserMedal(message<getUserMedalRequest>)
  | @as(304) WearMedal(message<wearMedalRequest>)
  | @as(305) CancelWearMedal(emptyMessage)
  | @as(900) CheckLiveAuth(emptyMessage)
  | @as(901) GetLiveTypeList(emptyMessage)
  | @as(902) GetPushConfig(emptyMessage)
  | @as(903) GetLiveStatus(emptyMessage)
  | @as(904) GetTranscodeInfo(message<getTranscodeInfoRequest>)
  | @as(905) StartLive(message<startLiveRequest>)
  | @as(906) StopLive(message<stopLiveRequest>)
  | @as(907) ChangeTitleAndCover(message<changeTitleAndCoverRequest>)
  | @as(908) GetLiveCutStatus(emptyMessage)
  | @as(909) SetLiveCutStatus(message<setLiveCutStatusRequest>)

type responseData =
  | @as(1) Heartbeat
  | @as(2) Login(response<loginResponse>)
  | @as(3) SetClientID(emptyResponse)
  | @as(4) RequestForward(emptyResponse)
  | @as(5) ReceiveForward(response<receiveForwardResponse>)
  | @as(6) SetToken(emptyResponse)
  | @as(100) GetDanmaku(optionalResponse<getDanmakuResponse>)
  | @as(101) StopDanmaku(emptyResponse)
  | @as(102) GetWatchingList(response<getWatchingListResponse>)
  | @as(103) GetBillboard(response<getBillboardResponse>)
  | @as(104) GetSummary(response<getSummaryResponse>)
  | @as(105) GetLuckList(response<getLuckListResponse>)
  | @as(106) GetPlayback(response<getPlaybackResponse>)
  | @as(107) GetAllGiftList(response<getAllGiftListResponse>)
  | @as(108) GetWalletBalance(response<getWalletBalanceResponse>)
  | @as(109) GetUserLiveInfo(response<getUserLiveInfoResponse>)
  | @as(110) GetAllLiveList(response<getAllLiveListResponse>)
  | @as(112) GetLiveData(response<getLiveDataResponse>)
  | @as(114) GetGiftList(response<getGiftListResponse>)
  | @as(115) GetUserInfo(response<getUserInfoResponse>)
  | @as(116) GetLiveCutInfo(response<getLiveCutInfoResponse>)
  | @as(200) GetManagerList(response<getManagerListResponse>)
  | @as(201) AddManager(emptyResponse)
  | @as(202) DeleteManager(emptyResponse)
  | @as(203) GetAllKickHistory(response<getAllKickHistoryResponse>)
  | @as(204) ManagerKick(emptyResponse)
  | @as(205) AuthorKick(emptyResponse)
  | @as(300) GetMedalDetail(response<getMedalDetailResponse>)
  | @as(301) GetMedalList(response<getMedalListResponse>)
  | @as(302) GetMedalRankList(response<getMedalRankListResponse>)
  | @as(303) GetUserMedal(response<getUserMedalResponse>)
  | @as(304) WearMedal(emptyResponse)
  | @as(305) CancelWearMedal(emptyResponse)
  | @as(900) CheckLiveAuth(response<checkLiveAuthResponse>)
  | @as(901) GetLiveTypeList(response<getLiveTypeListResponse>)
  | @as(902) GetPushConfig(response<getPushConfigResponse>)
  | @as(903) GetLiveStatus(response<getLiveStatusResponse>)
  | @as(904) GetTranscodeInfo(response<getTranscodeInfoResponse>)
  | @as(905) StartLive(response<startLiveResponse>)
  | @as(906) StopLive(response<stopLiveResponse>)
  | @as(907) ChangeTitleAndCover(emptyResponse)
  | @as(908) GetLiveCutStatus(response<getLiveCutStatusResponse>)
  | @as(909) SetLiveCutStatus(emptyResponse)
  | @as(1000) Comment(danmaku<comment>)
  | @as(1001) Like(danmaku<like>)
  | @as(1002) EnterRoom(danmaku<enterRoom>)
  | @as(1003) FollowAuthor(danmaku<followAuthor>)
  | @as(1004) ThrowBanana(danmaku<throwBanana>)
  | @as(1005) Gift(danmaku<gift>)
  | @as(1006) RichText(danmaku<richText>)
  | @as(1007) JoinClub(danmaku<joinClub>)
  | @as(1008) ShareLive(danmaku<shareLive>)
  | @as(2000) DanmakuStop(emptyDanmaku)
  | @as(2001) BananaCount(danmaku<bananaCount>)
  | @as(2002) DisplayInfo(danmaku<displayInfo>)
  | @as(2003) TopUsers(danmaku<topUsers>)
  | @as(2004) RecentComments(danmaku<recentComments>)
  | @as(2005) RedpackList(danmaku<redpackList>)
  | @as(2100) ChatCall(danmaku<chatCall>)
  | @as(2101) ChatAccept(danmaku<chatAccept>)
  | @as(2102) ChatReady(danmaku<chatReady>)
  | @as(2103) ChatEnd(danmaku<chatEnd>)
  | @as(2999) DanmakuStopError(danmaku<danmakuStopError>)
  | @as(3000) KickedOut(danmaku<kickedOut>)
  | @as(3001) ViolationAlert(danmaku<violationAlert>)
  | @as(3002) ManagerState(danmaku<managerState>)
