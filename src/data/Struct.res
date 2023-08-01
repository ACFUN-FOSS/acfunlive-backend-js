open RescriptStruct

open Message

let makeEmptyRequestStruct = type_ =>
  S.object(o => {
    o->S.field("type", S.literal(Int(type_->requestTypeToInt)))->ignore

    {
      requestID: o->S.field("requestID", S.string()),
    }
  })

let makeRequestStruct = (type_, struct) =>
  S.object(o => {
    o->S.field("type", S.literal(Int(type_->requestTypeToInt)))->ignore

    let message: message<'a> = {
      requestID: o->S.field("requestID", S.string()),
      data: o->S.field("data", struct),
    }

    message
  })

let loginRequestStruct = makeRequestStruct(
  Login,
  S.object(o => {
    account: o->S.field("account", S.string()),
    password: o->S.field("password", S.string()),
  }),
)

let setClientIDRequestStruct = makeRequestStruct(
  SetClientID,
  S.object(o => {clientID: o->S.field("clientID", S.string())}),
)

let forwardDataStruct = S.object(o => {
  clientID: o->S.field("clientID", S.string()),
  message: o->S.field("message", S.string()),
})

let requestForwardRequestStruct = makeRequestStruct(RequestForward, forwardDataStruct)

let tokenInfoStruct = S.object(o => {
  userID: o->S.field("userID", S.float()),
  securityKey: o->S.field("securityKey", S.string()),
  serviceToken: o->S.field("serviceToken", S.string()),
  deviceID: o->S.field("deviceID", S.string()),
  cookies: o->S.field("cookies", S.array(S.string())),
})

let setTokenRequestStruct = makeRequestStruct(SetToken, tokenInfoStruct)

let liverUIDStruct = S.object(o => {liverUID: o->S.field("liverUID", S.int())})

let getDanmakuRequestStruct = makeRequestStruct(GetDanmaku, liverUIDStruct)

let stopDanmakuRequestStruct = makeRequestStruct(StopDanmaku, liverUIDStruct)

let liveIDStruct = S.object(o => {liveID: o->S.field("liveID", S.string())})

let getWatchingListRequestStruct = makeRequestStruct(GetWatchingList, liveIDStruct)

let getBillboardRequestStruct = makeRequestStruct(GetBillboard, liverUIDStruct)

let getSummaryRequestStruct = makeRequestStruct(GetSummary, liveIDStruct)

let getLuckListRequestStruct = makeRequestStruct(
  GetLuckList,
  S.object(o => {
    liveID: o->S.field("liveID", S.string()),
    redpackID: o->S.field("redpackID", S.string()),
    redpackBizUnit: o->S.field("redpackBizUnit", S.string()),
  }),
)

let getPlaybackRequestStruct = makeRequestStruct(GetPlayback, liveIDStruct)

let userIDStruct = S.object(o => {userID: o->S.field("userID", S.int())})

let getUserLiveInfoRequestStruct = makeRequestStruct(GetUserLiveInfo, userIDStruct)

let getLiveDataRequestStruct = makeRequestStruct(
  GetLiveData,
  S.object(o => {days: o->S.field("days", S.int())}),
)

let getGiftListRequestStruct = makeRequestStruct(GetGiftList, liveIDStruct)

let getUserInfoRequestStruct = makeRequestStruct(GetUserInfo, userIDStruct)

let getLiveCutInfoRequestStruct = makeRequestStruct(
  GetLiveCutInfo,
  S.object(o => {
    liverUID: o->S.field("liverUID", S.int()),
    liveID: o->S.field("liveID", S.string()),
  }),
)

let managerUIDStruct = S.object(o => {
  managerUID: o->S.field("managerUID", S.int()),
})

let addManagerRequestStruct = makeRequestStruct(AddManager, managerUIDStruct)

let deleteManagerRequestStruct = makeRequestStruct(DeleteManager, managerUIDStruct)

let getAllKickHistoryRequestStruct = makeRequestStruct(GetAllKickHistory, liveIDStruct)

let kickUserStruct = S.object(o => {
  liveID: o->S.field("liveID", S.string()),
  kickedUID: o->S.field("kickedUID", S.int()),
})

let managerKickRequestStruct = makeRequestStruct(ManagerKick, kickUserStruct)

let authorKickRequestStruct = makeRequestStruct(AuthorKick, kickUserStruct)

let getMedalDetailRequestStruct = makeRequestStruct(GetMedalDetail, liverUIDStruct)

let getMedalRankListRequestStruct = makeRequestStruct(GetMedalRankList, liverUIDStruct)

let getUserMedalRequestStruct = makeRequestStruct(GetUserMedal, userIDStruct)

let wearMedalRequestStruct = makeRequestStruct(WearMedal, liverUIDStruct)

let getTranscodeInfoRequestStruct = makeRequestStruct(
  GetTranscodeInfo,
  S.object(o => {streamName: o->S.field("streamName", S.string())}),
)

let startLiveRequestStruct = makeRequestStruct(
  StartLive,
  S.object(o => {
    title: o->S.field("title", S.string()),
    coverFile: o->S.field("coverFile", S.string()),
    streamName: o->S.field("streamName", S.string()),
    portrait: o->S.field("portrait", S.bool()),
    panoramic: o->S.field("panoramic", S.bool()),
    categoryID: o->S.field("categoryID", S.int()),
    subCategoryID: o->S.field("subCategoryID", S.int()),
  }),
)

let stopLiveRequestStruct = makeRequestStruct(StopLive, liveIDStruct)

let changeTitleAndCoverRequestStruct = makeRequestStruct(
  ChangeTitleAndCover,
  S.object(o => {
    title: o->S.field("title", S.string()),
    coverFile: o->S.field("coverFile", S.string()),
    liveID: o->S.field("liveID", S.string()),
  }),
)

let canCutLiveStruct = S.object(o => {canCut: o->S.field("canCut", S.bool())})

let setLiveCutStatusRequestStruct = makeRequestStruct(SetLiveCutStatus, canCutLiveStruct)

let serializeRequest = (request: requestData) =>
  switch request {
  | Login(v) => S.serializeToJsonWith(v, loginRequestStruct)
  | SetClientID(v) => S.serializeToJsonWith(v, setClientIDRequestStruct)
  | RequestForward(v) => S.serializeToJsonWith(v, requestForwardRequestStruct)
  | SetToken(v) => S.serializeToJsonWith(v, setTokenRequestStruct)
  | GetDanmaku(v) => S.serializeToJsonWith(v, getDanmakuRequestStruct)
  | StopDanmaku(v) => S.serializeToJsonWith(v, stopDanmakuRequestStruct)
  | GetWatchingList(v) => S.serializeToJsonWith(v, getWatchingListRequestStruct)
  | GetBillboard(v) => S.serializeToJsonWith(v, getBillboardRequestStruct)
  | GetSummary(v) => S.serializeToJsonWith(v, getSummaryRequestStruct)
  | GetLuckList(v) => S.serializeToJsonWith(v, getLuckListRequestStruct)
  | GetPlayback(v) => S.serializeToJsonWith(v, getPlaybackRequestStruct)
  | GetAllGiftList(v) => S.serializeToJsonWith(v, makeEmptyRequestStruct(GetAllGiftList))
  | GetWalletBalance(v) => S.serializeToJsonWith(v, makeEmptyRequestStruct(GetWalletBalance))
  | GetUserLiveInfo(v) => S.serializeToJsonWith(v, getUserLiveInfoRequestStruct)
  | GetAllLiveList(v) => S.serializeToJsonWith(v, makeEmptyRequestStruct(GetAllLiveList))
  | GetLiveData(v) => S.serializeToJsonWith(v, getLiveDataRequestStruct)
  | GetGiftList(v) => S.serializeToJsonWith(v, getGiftListRequestStruct)
  | GetUserInfo(v) => S.serializeToJsonWith(v, getUserInfoRequestStruct)
  | GetLiveCutInfo(v) => S.serializeToJsonWith(v, getLiveCutInfoRequestStruct)
  | GetManagerList(v) => S.serializeToJsonWith(v, makeEmptyRequestStruct(GetManagerList))
  | AddManager(v) => S.serializeToJsonWith(v, addManagerRequestStruct)
  | DeleteManager(v) => S.serializeToJsonWith(v, deleteManagerRequestStruct)
  | GetAllKickHistory(v) => S.serializeToJsonWith(v, getAllKickHistoryRequestStruct)
  | ManagerKick(v) => S.serializeToJsonWith(v, managerKickRequestStruct)
  | AuthorKick(v) => S.serializeToJsonWith(v, authorKickRequestStruct)
  | GetMedalDetail(v) => S.serializeToJsonWith(v, getMedalDetailRequestStruct)
  | GetMedalList(v) => S.serializeToJsonWith(v, makeEmptyRequestStruct(GetMedalList))
  | GetMedalRankList(v) => S.serializeToJsonWith(v, getMedalRankListRequestStruct)
  | GetUserMedal(v) => S.serializeToJsonWith(v, getUserMedalRequestStruct)
  | WearMedal(v) => S.serializeToJsonWith(v, wearMedalRequestStruct)
  | CancelWearMedal(v) => S.serializeToJsonWith(v, makeEmptyRequestStruct(CancelWearMedal))
  | CheckLiveAuth(v) => S.serializeToJsonWith(v, makeEmptyRequestStruct(CheckLiveAuth))
  | GetLiveTypeList(v) => S.serializeToJsonWith(v, makeEmptyRequestStruct(GetLiveTypeList))
  | GetPushConfig(v) => S.serializeToJsonWith(v, makeEmptyRequestStruct(GetPushConfig))
  | GetLiveStatus(v) => S.serializeToJsonWith(v, makeEmptyRequestStruct(GetLiveStatus))
  | GetTranscodeInfo(v) => S.serializeToJsonWith(v, getTranscodeInfoRequestStruct)
  | StartLive(v) => S.serializeToJsonWith(v, startLiveRequestStruct)
  | StopLive(v) => S.serializeToJsonWith(v, stopLiveRequestStruct)
  | ChangeTitleAndCover(v) => S.serializeToJsonWith(v, changeTitleAndCoverRequestStruct)
  | GetLiveCutStatus(v) => S.serializeToJsonWith(v, makeEmptyRequestStruct(GetLiveCutStatus))
  | SetLiveCutStatus(v) => S.serializeToJsonWith(v, setLiveCutStatusRequestStruct)
  }

let responseTypeStruct = S.int()->S.variant(v => v->intToResponseType)

let responseResultStruct = S.int()->S.variant(v => v->intToResponseResult)

let loginResponseStruct = S.object(o => o->S.field("tokenInfo", tokenInfoStruct))

let streamURLStruct = S.object(o => {
  url: o->S.field("url", S.string()),
  bitrate: o->S.field("bitrate", S.int()),
  qualityType: o->S.field("qualityType", S.string()),
  qualityName: o->S.field("qualityName", S.string()),
})

let streamInfoStruct = S.object(o => {
  liveID: o->S.field("liveID", S.string()),
  title: o->S.field("title", S.string()),
  liveStartTime: o->S.field("liveStartTime", S.float()),
  panoramic: o->S.field("panoramic", S.bool()),
  streamList: o->S.field("streamList", S.array(streamURLStruct)),
  streamName: o->S.field("streamName", S.string()),
})

let getDanmakuResponse = S.object(o => o->S.field("StreamInfo", streamInfoStruct))

let medalInfoStruct = S.object(o => {
  uperID: o->S.field("uperID", S.int()),
  userID: o->S.field("userID", S.int()),
  clubName: o->S.field("clubName", S.string()),
  level: o->S.field("level", S.int()),
})

let userInfoStruct = S.object(o => {
  userID: o->S.field("userID", S.float()),
  nickname: o->S.field("nickname", S.string()),
  avatar: o->S.field("avatar", S.string()),
  medal: o->S.field("medal", medalInfoStruct),
  managerType: o->S.field("managerType", S.int()->S.variant(v => v->intToManagerType)),
})

let watchingUserStruct = S.object(o => {
  userInfo: o->S.field("userInfo", userInfoStruct),
  anonymousUser: o->S.field("anonymousUser", S.bool()),
  displaySendAmount: o->S.field("displaySendAmount", S.string()),
  customData: o->S.field("customData", S.string()),
})

let getWatchingListResponseStruct = S.array(watchingUserStruct)

let getBillboardResponseStruct = S.array(watchingUserStruct)

let getSummaryResponseStruct = S.object(o => {
  duration: o->S.field("duration", S.int()),
  likeCount: o->S.field("likeCount", S.string()),
  watchCount: o->S.field("watchCount", S.string()),
  giftCount: o->S.field("giftCount", S.int()),
  diamondCount: o->S.field("diamondCount", S.int()),
  bananaCount: o->S.field("bananaCount", S.int()),
})

let luckyUserStruct = S.object(o => {
  userInfo: o->S.field("userInfo", userInfoStruct),
  grabAmount: o->S.field("grabAmount", S.int()),
})

let getLuckListResponseStruct = S.array(luckyUserStruct)

let getPlaybackResponseStruct = S.object(o => {
  duration: o->S.field("duration", S.int()),
  url: o->S.field("url", S.string()),
  backupURL: o->S.field("backupURL", S.string()),
  m3u8Slice: o->S.field("m3u8Slice", S.string()),
  width: o->S.field("width", S.int()),
  height: o->S.field("height", S.int()),
})

let giftDetailStruct = S.object(o => {
  giftID: o->S.field("giftID", S.int()),
  giftName: o->S.field("giftName", S.string()),
  arLiveName: o->S.field("arLiveName", S.string()),
  payWalletType: o->S.field("payWalletType", S.int()->S.variant(v => v->intToGiftPayType)),
  price: o->S.field("price", S.int()),
  webpPic: o->S.field("webpPic", S.string()),
  pngPic: o->S.field("pngPic", S.string()),
  smallPngPic: o->S.field("smallPngPic", S.string()),
  allowBatchSendSizeList: ?o->S.field("allowBatchSendSizeList", S.null(S.array(S.int()))),
  canCombo: o->S.field("canCombo", S.bool()),
  canDraw: o->S.field("canDraw", S.bool()),
  magicFaceID: o->S.field("magicFaceID", S.int()),
  vupArID: o->S.field("vupArID", S.int()),
  description: o->S.field("description", S.string()),
  redpackPrice: o->S.field("redpackPrice", S.int()),
  cornerMarkerText: o->S.field("cornerMarkerText", S.string()),
})

let getAllGiftListResponseStruct = S.array(giftDetailStruct)

let getWalletBalanceResponseStruct = S.object(o => {
  acCoin: o->S.field("acCoin", S.int()),
  banana: o->S.field("banana", S.int()),
})

let userProfileStruct = S.object(o => {
  userID: o->S.field("userID", S.int()),
  nickname: o->S.field("nickname", S.string()),
  avatar: o->S.field("avatar", S.string()),
  avatarFrame: o->S.field("avatarFrame", S.string()),
  followingCount: o->S.field("followingCount", S.int()),
  fansCount: o->S.field("fansCount", S.int()),
  contributeCount: o->S.field("contributeCount", S.int()),
  signature: o->S.field("signature", S.string()),
  verifiedText: o->S.field("verifiedText", S.string()),
  isJoinUpCollege: o->S.field("isJoinUpCollege", S.bool()),
  isFollowing: o->S.field("isFollowing", S.bool()),
  isFollowed: o->S.field("isFollowed", S.bool()),
})

let liveTypeStruct = S.object(o => {
  categoryID: o->S.field("categoryID", S.int()),
  categoryName: o->S.field("categoryName", S.string()),
  subCategoryID: o->S.field("subCategoryID", S.int()),
  subCategoryName: o->S.field("subCategoryName", S.string()),
})

let userLiveInfoStruct = S.object(o => {
  profile: o->S.field("profile", userProfileStruct),
  liveType: o->S.field("liveType", liveTypeStruct),
  liveID: o->S.field("liveID", S.string()),
  streamName: o->S.field("streamName", S.string()),
  title: o->S.field("title", S.string()),
  liveStartTime: o->S.field("liveStartTime", S.float()),
  portrait: o->S.field("portrait", S.bool()),
  panoramic: o->S.field("panoramic", S.bool()),
  liveCover: o->S.field("liveCover", S.string()),
  onlineCount: o->S.field("onlineCount", S.int()),
  likeCount: o->S.field("likeCount", S.int()),
  hasFansClub: o->S.field("hasFansClub", S.bool()),
  disableDanmakuShow: o->S.field("disableDanmakuShow", S.bool()),
  paidShowUserBuyStatus: o->S.field("paidShowUserBuyStatus", S.bool()),
})

let getUserLiveInfoResponseStruct = userLiveInfoStruct

let getAllLiveListResponseStruct = S.array(userLiveInfoStruct)

let liveStatStruct = S.object(o => {
  duration: o->S.field("duration", S.int()),
  maxPopularityValue: o->S.field("maxPopularityValue", S.int()),
  watchCount: o->S.field("watchCount", S.int()),
  diamondCount: o->S.field("diamondCount", S.int()),
  commentCount: o->S.field("commentCount", S.int()),
  bananaCount: o->S.field("bananaCount", S.int()),
})

let liveDetailStruct = S.object(o => {
  liveStartTime: o->S.field("liveStartTime", S.float()),
  liveEndTime: o->S.field("liveEndTime", S.float()),
  liveStat: o->S.field("liveStat", liveStatStruct),
})

let dailyDataStruct = S.object(o => {
  date: o->S.field("date", S.string()),
  liveTimes: o->S.field("liveTimes", S.int()),
  liveStat: o->S.field("liveStat", liveStatStruct),
})

let getLiveDataResponseStruct = S.object(o => {
  beginDate: o->S.field("beginDate", S.string()),
  endDate: o->S.field("endDate", S.string()),
  overview: o->S.field("overview", liveStatStruct),
  liveDetail: o->S.field("liveDetail", S.dict(liveDetailStruct)),
  dailyData: o->S.field("dailyData", S.array(dailyDataStruct)),
})

let getGiftListResponseStruct = S.array(giftDetailStruct)

let getUserInfoResponseStruct = S.object(o => {
  userID: o->S.field("userID", S.int()),
  nickname: o->S.field("nickname", S.string()),
  avatar: o->S.field("avatar", S.string()),
  avatarFrame: o->S.field("avatarFrame", S.string()),
  followingCount: o->S.field("followingCount", S.string()),
  fansCount: o->S.field("fansCount", S.string()),
  contributeCount: o->S.field("contributeCount", S.string()),
  signature: o->S.field("signature", S.string()),
  verifiedText: o->S.field("verifiedText", S.string()),
  isJoinUpCollege: o->S.field("isJoinUpCollege", S.bool()),
  isFollowing: o->S.field("isFollowing", S.bool()),
  isFollowed: o->S.field("isFollowed", S.bool()),
  liveID: o->S.field("liveID", S.string()),
  likeCount: o->S.field("likeCount", S.int()),
})

let getLiveCutInfoResponseStruct = S.object(o => {
  status: o->S.field("status", S.bool()),
  url: o->S.field("url", S.string()),
  redirectURL: o->S.field("redirectURL", S.string()),
})

let managerStruct = S.object(o => {
  userInfo: o->S.field("userInfo", userInfoStruct),
  customData: o->S.field("customData", S.string()),
  online: o->S.field("online", S.bool()),
})

let getManagerListResponseStruct = S.array(managerStruct)

let kickHistoryStruct = S.object(o => {
  userID: o->S.field("userID", S.int()),
  nickname: o->S.field("nickname", S.string()),
  kickTime: o->S.field("kickTime", S.float()),
})

let getAllKickHistoryResponseStruct = S.array(kickHistoryStruct)

let medalStruct = S.object(o => {
  medalInfo: o->S.field("medalInfo", medalInfoStruct),
  uperName: o->S.field("uperName", S.string()),
  uperAvatar: o->S.field("uperAvatar", S.string()),
  wearMedal: o->S.field("wearMedal", S.bool()),
  friendshipDegree: o->S.field("friendshipDegree", S.int()),
  joinClubTime: o->S.field("joinClubTime", S.float()),
  currentDegreeLimit: o->S.field("currentDegreeLimit", S.int()),
  medalCount: o->S.field("medalCount", S.int()),
})

let medalDegreeStruct = S.object(o => {
  uperID: o->S.field("uperID", S.int()),
  giftDegree: o->S.field("giftDegree", S.int()),
  giftDegreeLimit: o->S.field("giftDegreeLimit", S.int()),
  peachDegree: o->S.field("peachDegree", S.int()),
  peachDegreeLimit: o->S.field("peachDegreeLimit", S.int()),
  liveWatchDegree: o->S.field("liveWatchDegree", S.int()),
  liveWatchDegreeLimit: o->S.field("liveWatchDegreeLimit", S.int()),
  bananaDegree: o->S.field("bananaDegree", S.int()),
  bananaDegreeLimit: o->S.field("bananaDegreeLimit", S.int()),
})

let getMedalDetailResponseStruct = S.object(o => {
  medal: o->S.field("medal", medalStruct),
  medalDegree: o->S.field("medalDegree", medalDegreeStruct),
  userRank: o->S.field("userRank", S.string()),
})

let getMedalListResponseStruct = S.array(medalStruct)

let userMedalInfoStruct = S.object(o => {
  profile: o->S.field("profile", userProfileStruct),
  friendshipDegree: o->S.field("friendshipDegree", S.int()),
  level: o->S.field("level", S.int()),
})

let getMedalRankListResponseStruct = S.object(o => {
  hasFansClub: o->S.field("hasFansClub", S.bool()),
  rankList: o->S.field("rankList", S.array(userMedalInfoStruct)),
  clubName: o->S.field("clubName", S.string()),
  medalCount: o->S.field("medalCount", S.int()),
  hasMedal: o->S.field("hasMedal", S.bool()),
  userFriendshipDegree: o->S.field("userFriendshipDegree", S.int()),
  userRank: o->S.field("userRank", S.string()),
})

let getUserMedalResponseStruct = medalStruct

let checkLiveAuthResponseStruct = S.object(o => {liveAuth: o->S.field("liveAuth", S.bool())})

let getLiveTypeListResponseStruct = liveTypeStruct

let getPushConfigResponseStruct = S.object(o => {
  streamName: o->S.field("streamName", S.string()),
  streamPullAddress: o->S.field("streamPullAddress", S.string()),
  streamPushAddress: o->S.field("streamPushAddress", S.array(S.string())),
  panoramic: o->S.field("panoramic", S.bool()),
  interval: o->S.field("interval", S.int()),
  rtmpServer: o->S.field("rtmpServer", S.string()),
  streamKey: o->S.field("streamKey", S.string()),
})

let getLiveStatusResponseStruct = S.object(o => {
  liveID: o->S.field("liveID", S.string()),
  streamName: o->S.field("streamName", S.string()),
  title: o->S.field("title", S.string()),
  liveCover: o->S.field("liveCover", S.string()),
  liveStartTime: o->S.field("liveStartTime", S.float()),
  panoramic: o->S.field("panoramic", S.bool()),
  bizUnit: o->S.field("bizUnit", S.string()),
  bizCustomData: o->S.field("bizCustomData", S.string()),
})

let transcodeInfoStruct = S.object(o => {
  streamURL: o->S.field("streamURL", streamURLStruct),
  resolution: o->S.field("resolution", S.string()),
  frameRate: o->S.field("frameRate", S.int()),
  template: o->S.field("template", S.string()),
})

let getTranscodeInfoResponseStruct = S.array(transcodeInfoStruct)

let startLiveResponseStruct = liveIDStruct

let stopLiveResponseStruct = S.object(o => {
  duration: o->S.field("duration", S.int()),
  endReason: o->S.field("endReason", S.string()),
})

let getLiveCutStatusResponseStruct = canCutLiveStruct

let danmuInfoStruct = S.object(o => {
  sendTime: o->S.field("sendTime", S.float()),
  userInfo: o->S.field("userInfo", userInfoStruct),
})

let commentStruct = S.object(o => {
  danmuInfo: o->S.field("danmuInfo", danmuInfoStruct),
  content: o->S.field("content", S.string()),
})

let throwBananaStruct = S.object(o => {
  danmuInfo: o->S.field("danmuInfo", danmuInfoStruct),
  bananaCount: o->S.field("bananaCount", S.int()),
})

let drawPointStruct = S.object(o => {
  marginLeft: o->S.field("marginLeft", S.int()),
  marginTop: o->S.field("marginTop", S.int()),
  scaleRatio: o->S.field("scaleRatio", S.int()),
  handup: o->S.field("handup", S.bool()),
  pointWidth: o->S.field("pointWidth", S.int()),
  pointHeight: o->S.field("pointHeight", S.int()),
})

let drawGiftInfoStruct = S.object(o => {
  screenWidth: o->S.field("screenWidth", S.int()),
  screenHeight: o->S.field("screenHeight", S.int()),
  drawPoint: ?o->S.field("drawPoint", S.null(S.array(drawPointStruct))),
})

let giftStruct = S.object(o => {
  danmuInfo: o->S.field("danmuInfo", danmuInfoStruct),
  giftDetail: o->S.field("giftDetail", giftDetailStruct),
  count: o->S.field("count", S.int()),
  combo: o->S.field("combo", S.int()),
  value: o->S.field("value", S.int()),
  comboID: o->S.field("comboID", S.string()),
  slotDisplayDuration: o->S.field("slotDisplayDuration", S.int()),
  expireDuration: o->S.field("expireDuration", S.int()),
  drawGiftInfo: o->S.field("drawGiftInfo", drawGiftInfoStruct),
})

let richTextUserInfoStruct = S.object(o => {
  userInfo: o->S.field("userInfo", userInfoStruct),
  color: o->S.field("color", S.string()),
})

let richTextPlainStruct = S.object(o => {
  text: o->S.field("text", S.string()),
  color: o->S.field("color", S.string()),
})

let richTextImageStruct = S.object(o => {
  pictures: o->S.field("pictures", S.array(S.string())),
  alternativeText: o->S.field("alternativeText", S.string()),
  alternativeColor: o->S.field("alternativeColor", S.string()),
})

let richTextSegmentStruct = S.union([
  S.object(o => {
    o->S.field("type", S.literal(Int(1900)))->ignore
    UserInfo({segment: o->S.field("segment", richTextUserInfoStruct)})
  }),
  S.object(o => {
    o->S.field("type", S.literal(Int(1901)))->ignore
    Plain({segment: o->S.field("segment", richTextPlainStruct)})
  }),
  S.object(o => {
    o->S.field("type", S.literal(Int(1902)))->ignore
    Image({segment: o->S.field("segment", richTextImageStruct)})
  }),
])

let richTextStruct = S.object(o => {
  sendTime: o->S.field("sendTime", S.float()),
  segments: o->S.field("segments", S.array(richTextSegmentStruct)),
})

let joinClubStruct = S.object(o => {
  joinTime: o->S.field("joinTime", S.float()),
  fansInfo: o->S.field("fansInfo", userInfoStruct),
  uperInfo: o->S.field("uperInfo", userInfoStruct),
})

let shareLiveStruct = S.object(o => {
  danmuInfo: o->S.field("danmuInfo", danmuInfoStruct),
  sharePlatform: o->S.field("sharePlatform", S.int()->S.variant(v => v->intToSharePlatformType)),
  sharePlatformIcon: o->S.field("sharePlatformIcon", S.string()),
})

let bananaCountStruct = S.object(o => {
  bananaCount: o->S.field("bananaCount", S.string()),
})

let displayInfoStruct = S.object(o => {
  watchingCount: o->S.field("watchingCount", S.string()),
  likeCount: o->S.field("likeCount", S.string()),
  likeDelta: o->S.field("likeDelta", S.int()),
})

let watchingUserStruct = S.object(o => {
  userInfo: o->S.field("userInfo", userInfoStruct),
  anonymousUser: o->S.field("anonymousUser", S.bool()),
  displaySendAmount: o->S.field("displaySendAmount", S.string()),
  customData: o->S.field("customData", S.string()),
})

let topUsersStruct = S.array(watchingUserStruct)

let recentCommentsStruct = S.array(commentStruct)

let redpackStruct = S.object(o => {
  userInfo: o->S.field("userInfo", userInfoStruct),
  displayStatus: o->S.field("displayStatus", S.int()->S.variant(v => v->intToRedpackDisplayStatus)),
  grabBeginTime: o->S.field("grabBeginTime", S.float()),
  getTokenLatestTime: o->S.field("getTokenLatestTime", S.float()),
  redpackID: o->S.field("redpackID", S.string()),
  redpackBizUnit: o->S.field("redpackBizUnit", S.string()),
  redpackAmount: o->S.field("redpackAmount", S.int()),
  settleBeginTime: o->S.field("settleBeginTime", S.float()),
})

let redpackListStruct = S.array(redpackStruct)

let chatCallStruct = S.object(o => {
  chatID: o->S.field("chatID", S.string()),
  liveID: o->S.field("liveID", S.string()),
  callTime: o->S.field("callTime", S.float()),
})

let chatAcceptStruct = S.object(o => {
  chatID: o->S.field("chatID", S.string()),
  mediaType: o->S.field("mediaType", S.int()->S.variant(v => v->intToChatMediaType)),
  signalInfo: o->S.field("signalInfo", S.string()),
})

let chatReadyStruct = S.object(o => {
  chatID: o->S.field("chatID", S.string()),
  guest: o->S.field("guest", userInfoStruct),
  mediaType: o->S.field("mediaType", S.int()->S.variant(v => v->intToChatMediaType)),
})

let chatEndStruct = S.object(o => {
  chatID: o->S.field("chatID", S.string()),
  endType: o->S.field("endType", S.int()->S.variant(v => v->intToChatEndType)),
})

let danmakuStopErrorStruct = S.object(o => {error: o->S.field("error", S.string())})

let kickedOutStruct = S.object(o => {
  kickedOutReason: o->S.field("kickedOutReason", S.string()),
})

let violationAlertStruct = S.object(o => {
  violationContent: o->S.field("violationContent", S.string()),
})

let managerStateStruct = S.object(o => {
  managerState: o->S.field("managerState", S.int()->S.variant(v => v->intToManagerStateType)),
})

type responseModel = {
  type_: responseType,
  liverUID: int,
  requestID: string,
  result: responseResult,
  error: string,
}

let responseModelStruct = S.object(o => {
  type_: o->S.field("type", responseTypeStruct),
  liverUID: o->S.field("liverUID", S.option(S.int())->S.default(() => 0)),
  requestID: o->S.field("requestID", S.option(S.string())->S.default(() => "")),
  result: o->S.field("result", S.option(responseResultStruct)->S.default(() => UnknownResult(0))),
  error: o->S.field("error", S.option(S.string())->S.default(() => "")),
})

let makeEmptyResponseData = ({requestID, result, error}, constructor) =>
  switch result {
  | Success => constructor(Ok({requestID: requestID}))
  | JsonParseError | InvalidRequestType | InvalidRequestData | HandleRequestError | NeedLogin =>
    constructor(Error({requestID, result, error}))
  | UnknownResult(n) => S.fail(`unknown result type: ${n->Int.toString}`)
  }

let makeResponseData = (data, {requestID, result, error}, struct, constructor) =>
  switch result {
  | Success =>
    switch data->S.parseAnyWith(S.object(o => o->S.field("data", struct))) {
    | Ok(d) => {
        let message: message<'b> = {requestID, data: d}
        constructor(Ok(message))
      }
    | Error(e) => S.advancedFail(e)
    }
  | JsonParseError | InvalidRequestType | InvalidRequestData | HandleRequestError | NeedLogin =>
    constructor(Error({requestID, result, error}))
  | UnknownResult(n) => S.fail(`unknown result type: ${n->Int.toString}`)
  }

let makeOptionalResponseData = (data, {requestID, result, error}, struct, constructor) =>
  switch result {
  | Success =>
    switch data->S.parseAnyWith(S.object(o => o->S.field("data", S.option(struct)))) {
    | Ok(Some(d)) => constructor(Ok({requestID, data: d}))
    | Ok(None) => constructor(Ok({requestID: requestID}))
    | Error(e) => S.advancedFail(e)
    }
  | JsonParseError | InvalidRequestType | InvalidRequestData | HandleRequestError | NeedLogin =>
    constructor(Error({requestID, result, error}))
  | UnknownResult(n) => S.fail(`unknown result type: ${n->Int.toString}`)
  }

let makeEmptyDanmakuData = ({liverUID}, constructor) =>
  if liverUID > 0 {
    let danmaku: emptyDanmaku = {liverUID: liverUID}
    constructor(danmaku)
  } else {
    S.fail("missing liverUID or illegal liverUID")
  }

let makeDanmakuData = (data, {liverUID}, struct, constructor) =>
  if liverUID > 0 {
    switch data->S.parseAnyWith(S.object(o => o->S.field("data", struct))) {
    | Ok(d) => constructor({liverUID, data: d})
    | Error(e) => S.advancedFail(e)
    }
  } else {
    S.fail("missing liverUID or illegal liverUID")
  }

let responseDataStruct = S.custom(
  ~name="responseData",
  ~parser=data => {
    switch data->S.parseAnyWith(responseModelStruct) {
    | Ok(model) =>
      switch model.type_ {
      | Heartbeat => Heartbeat
      | Login => makeResponseData(data, model, loginResponseStruct, v => Login(v))
      | SetClientID => makeEmptyResponseData(model, v => SetClientID(v))
      | RequestForward => makeEmptyResponseData(model, v => RequestForward(v))
      | ReceiveForward => makeResponseData(data, model, forwardDataStruct, v => ReceiveForward(v))
      | SetToken => makeEmptyResponseData(model, v => SetToken(v))
      | GetDanmaku => makeOptionalResponseData(data, model, getDanmakuResponse, v => GetDanmaku(v))
      | StopDanmaku => makeEmptyResponseData(model, v => StopDanmaku(v))
      | GetWatchingList =>
        makeResponseData(data, model, getWatchingListResponseStruct, v => GetWatchingList(v))
      | GetBillboard =>
        makeResponseData(data, model, getBillboardResponseStruct, v => GetBillboard(v))
      | GetSummary => makeResponseData(data, model, getSummaryResponseStruct, v => GetSummary(v))
      | GetLuckList => makeResponseData(data, model, getLuckListResponseStruct, v => GetLuckList(v))
      | GetPlayback => makeResponseData(data, model, getPlaybackResponseStruct, v => GetPlayback(v))
      | GetAllGiftList =>
        makeResponseData(data, model, getAllGiftListResponseStruct, v => GetAllGiftList(v))
      | GetWalletBalance =>
        makeResponseData(data, model, getWalletBalanceResponseStruct, v => GetWalletBalance(v))
      | GetUserLiveInfo =>
        makeResponseData(data, model, getUserLiveInfoResponseStruct, v => GetUserLiveInfo(v))
      | GetAllLiveList =>
        makeResponseData(data, model, getAllLiveListResponseStruct, v => GetAllLiveList(v))
      | GetLiveData => makeResponseData(data, model, getLiveDataResponseStruct, v => GetLiveData(v))
      | GetGiftList => makeResponseData(data, model, getGiftListResponseStruct, v => GetGiftList(v))
      | GetUserInfo => makeResponseData(data, model, getUserInfoResponseStruct, v => GetUserInfo(v))
      | GetLiveCutInfo =>
        makeResponseData(data, model, getLiveCutInfoResponseStruct, v => GetLiveCutInfo(v))
      | GetManagerList =>
        makeResponseData(data, model, getManagerListResponseStruct, v => GetManagerList(v))
      | AddManager => makeEmptyResponseData(model, v => AddManager(v))
      | DeleteManager => makeEmptyResponseData(model, v => DeleteManager(v))
      | GetAllKickHistory =>
        makeResponseData(data, model, getAllKickHistoryResponseStruct, v => GetAllKickHistory(v))
      | ManagerKick => makeEmptyResponseData(model, v => ManagerKick(v))
      | AuthorKick => makeEmptyResponseData(model, v => AuthorKick(v))
      | GetMedalDetail =>
        makeResponseData(data, model, getMedalDetailResponseStruct, v => GetMedalDetail(v))
      | GetMedalList =>
        makeResponseData(data, model, getMedalListResponseStruct, v => GetMedalList(v))
      | GetMedalRankList =>
        makeResponseData(data, model, getMedalRankListResponseStruct, v => GetMedalRankList(v))
      | GetUserMedal =>
        makeResponseData(data, model, getUserMedalResponseStruct, v => GetUserMedal(v))
      | WearMedal => makeEmptyResponseData(model, v => WearMedal(v))
      | CancelWearMedal => makeEmptyResponseData(model, v => CancelWearMedal(v))
      | CheckLiveAuth =>
        makeResponseData(data, model, checkLiveAuthResponseStruct, v => CheckLiveAuth(v))
      | GetLiveTypeList =>
        makeResponseData(data, model, getLiveTypeListResponseStruct, v => GetLiveTypeList(v))
      | GetPushConfig =>
        makeResponseData(data, model, getPushConfigResponseStruct, v => GetPushConfig(v))
      | GetLiveStatus =>
        makeResponseData(data, model, getLiveStatusResponseStruct, v => GetLiveStatus(v))
      | GetTranscodeInfo =>
        makeResponseData(data, model, getTranscodeInfoResponseStruct, v => GetTranscodeInfo(v))
      | StartLive => makeResponseData(data, model, startLiveResponseStruct, v => StartLive(v))
      | StopLive => makeResponseData(data, model, stopLiveResponseStruct, v => StopLive(v))
      | ChangeTitleAndCover => makeEmptyResponseData(model, v => ChangeTitleAndCover(v))
      | GetLiveCutStatus =>
        makeResponseData(data, model, getLiveCutStatusResponseStruct, v => GetLiveCutStatus(v))
      | SetLiveCutStatus => makeEmptyResponseData(model, v => SetLiveCutStatus(v))
      | Comment => makeDanmakuData(data, model, commentStruct, v => Comment(v))
      | Like => makeDanmakuData(data, model, danmuInfoStruct, v => Like(v))
      | EnterRoom => makeDanmakuData(data, model, danmuInfoStruct, v => EnterRoom(v))
      | FollowAuthor => makeDanmakuData(data, model, danmuInfoStruct, v => FollowAuthor(v))
      | ThrowBanana => makeDanmakuData(data, model, throwBananaStruct, v => ThrowBanana(v))
      | Gift => makeDanmakuData(data, model, giftStruct, v => Gift(v))
      | RichText => makeDanmakuData(data, model, richTextStruct, v => RichText(v))
      | JoinClub => makeDanmakuData(data, model, joinClubStruct, v => JoinClub(v))
      | ShareLive => makeDanmakuData(data, model, shareLiveStruct, v => ShareLive(v))
      | DanmakuStop => makeEmptyDanmakuData(model, v => DanmakuStop(v))
      | BananaCount => makeDanmakuData(data, model, bananaCountStruct, v => BananaCount(v))
      | DisplayInfo => makeDanmakuData(data, model, displayInfoStruct, v => DisplayInfo(v))
      | TopUsers => makeDanmakuData(data, model, topUsersStruct, v => TopUsers(v))
      | RecentComments => makeDanmakuData(data, model, recentCommentsStruct, v => RecentComments(v))
      | RedpackList => makeDanmakuData(data, model, redpackListStruct, v => RedpackList(v))
      | ChatCall => makeDanmakuData(data, model, chatCallStruct, v => ChatCall(v))
      | ChatAccept => makeDanmakuData(data, model, chatAcceptStruct, v => ChatAccept(v))
      | ChatReady => makeDanmakuData(data, model, chatReadyStruct, v => ChatReady(v))
      | ChatEnd => makeDanmakuData(data, model, chatEndStruct, v => ChatEnd(v))
      | DanmakuStopError =>
        makeDanmakuData(data, model, danmakuStopErrorStruct, v => DanmakuStopError(v))
      | KickedOut => makeDanmakuData(data, model, kickedOutStruct, v => KickedOut(v))
      | ViolationAlert => makeDanmakuData(data, model, violationAlertStruct, v => ViolationAlert(v))
      | ManagerState => makeDanmakuData(data, model, managerStateStruct, v => ManagerState(v))
      | UnknownResponse(v) => S.fail(`unsupported message type: ${v->Int.toString}`)
      }
    | Error(e) => S.advancedFail(e)
    }
  },
  (),
)

let parseResponse = response => response->S.parseJsonWith(responseDataStruct)
