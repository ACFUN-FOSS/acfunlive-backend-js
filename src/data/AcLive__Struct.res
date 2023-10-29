open RescriptStruct

open AcLive__Message

let makeEmptyRequestStruct = type_ =>
  S.object(s => {
    s.tag("type", type_->requestTypeToInt)

    {
      requestID: s.field("requestID", S.string),
    }
  })

let makeRequestStruct = (type_, struct) =>
  S.object(s => {
    s.tag("type", type_->requestTypeToInt)

    let message: message<'a> = {
      requestID: s.field("requestID", S.string),
      data: s.field("data", struct),
    }

    message
  })

let loginRequestStruct = makeRequestStruct(
  Login,
  S.object(s => {
    account: s.field("account", S.string),
    password: s.field("password", S.string),
  }),
)

let setClientIDRequestStruct = makeRequestStruct(
  SetClientID,
  S.object(s => {clientID: s.field("clientID", S.string)}),
)

let forwardDataStruct = S.object(s => {
  clientID: s.field("clientID", S.string),
  message: s.field("message", S.string),
})

let requestForwardRequestStruct = makeRequestStruct(RequestForward, forwardDataStruct)

let tokenInfoStruct = S.object(s => {
  userID: s.field("userID", S.float),
  securityKey: s.field("securityKey", S.string),
  serviceToken: s.field("serviceToken", S.string),
  deviceID: s.field("deviceID", S.string),
  cookies: s.field("cookies", S.array(S.string)),
})

let setTokenRequestStruct = makeRequestStruct(SetToken, tokenInfoStruct)

let liverUIDStruct = S.object(s => {liverUID: s.field("liverUID", S.int)})

let getDanmakuRequestStruct = makeRequestStruct(GetDanmaku, liverUIDStruct)

let stopDanmakuRequestStruct = makeRequestStruct(StopDanmaku, liverUIDStruct)

let liveIDStruct = S.object(s => {liveID: s.field("liveID", S.string)})

let getWatchingListRequestStruct = makeRequestStruct(GetWatchingList, liveIDStruct)

let getBillboardRequestStruct = makeRequestStruct(GetBillboard, liverUIDStruct)

let getSummaryRequestStruct = makeRequestStruct(GetSummary, liveIDStruct)

let getLuckListRequestStruct = makeRequestStruct(
  GetLuckList,
  S.object(s => {
    liveID: s.field("liveID", S.string),
    redpackID: s.field("redpackID", S.string),
    redpackBizUnit: s.field("redpackBizUnit", S.string),
  }),
)

let getPlaybackRequestStruct = makeRequestStruct(GetPlayback, liveIDStruct)

let userIDStruct = S.object(s => {userID: s.field("userID", S.int)})

let getUserLiveInfoRequestStruct = makeRequestStruct(GetUserLiveInfo, userIDStruct)

let getLiveDataRequestStruct = makeRequestStruct(
  GetLiveData,
  S.object(s => {days: s.field("days", S.int)}),
)

let getGiftListRequestStruct = makeRequestStruct(GetGiftList, liveIDStruct)

let getUserInfoRequestStruct = makeRequestStruct(GetUserInfo, userIDStruct)

let getLiveCutInfoRequestStruct = makeRequestStruct(
  GetLiveCutInfo,
  S.object(s => {
    liverUID: s.field("liverUID", S.int),
    liveID: s.field("liveID", S.string),
  }),
)

let managerUIDStruct = S.object(s => {
  managerUID: s.field("managerUID", S.int),
})

let addManagerRequestStruct = makeRequestStruct(AddManager, managerUIDStruct)

let deleteManagerRequestStruct = makeRequestStruct(DeleteManager, managerUIDStruct)

let getAllKickHistoryRequestStruct = makeRequestStruct(GetAllKickHistory, liveIDStruct)

let kickUserStruct = S.object(s => {
  liveID: s.field("liveID", S.string),
  kickedUID: s.field("kickedUID", S.int),
})

let managerKickRequestStruct = makeRequestStruct(ManagerKick, kickUserStruct)

let authorKickRequestStruct = makeRequestStruct(AuthorKick, kickUserStruct)

let getMedalDetailRequestStruct = makeRequestStruct(GetMedalDetail, liverUIDStruct)

let getMedalRankListRequestStruct = makeRequestStruct(GetMedalRankList, liverUIDStruct)

let getUserMedalRequestStruct = makeRequestStruct(GetUserMedal, userIDStruct)

let wearMedalRequestStruct = makeRequestStruct(WearMedal, liverUIDStruct)

let getTranscodeInfoRequestStruct = makeRequestStruct(
  GetTranscodeInfo,
  S.object(s => {streamName: s.field("streamName", S.string)}),
)

let startLiveRequestStruct = makeRequestStruct(
  StartLive,
  S.object(s => {
    title: s.field("title", S.string),
    coverFile: s.field("coverFile", S.string),
    streamName: s.field("streamName", S.string),
    portrait: s.field("portrait", S.bool),
    panoramic: s.field("panoramic", S.bool),
    categoryID: s.field("categoryID", S.int),
    subCategoryID: s.field("subCategoryID", S.int),
  }),
)

let stopLiveRequestStruct = makeRequestStruct(StopLive, liveIDStruct)

let changeTitleAndCoverRequestStruct = makeRequestStruct(
  ChangeTitleAndCover,
  S.object(s => {
    title: s.field("title", S.string),
    coverFile: s.field("coverFile", S.string),
    liveID: s.field("liveID", S.string),
  }),
)

let canCutLiveStruct = S.object(s => {canCut: s.field("canCut", S.bool)})

let setLiveCutStatusRequestStruct = makeRequestStruct(SetLiveCutStatus, canCutLiveStruct)

let serializeRequest = (request: requestData) =>
  switch request {
  | Login(v) => S.serializeToJsonStringWith(v, loginRequestStruct)
  | SetClientID(v) => S.serializeToJsonStringWith(v, setClientIDRequestStruct)
  | RequestForward(v) => S.serializeToJsonStringWith(v, requestForwardRequestStruct)
  | SetToken(v) => S.serializeToJsonStringWith(v, setTokenRequestStruct)
  | GetDanmaku(v) => S.serializeToJsonStringWith(v, getDanmakuRequestStruct)
  | StopDanmaku(v) => S.serializeToJsonStringWith(v, stopDanmakuRequestStruct)
  | GetWatchingList(v) => S.serializeToJsonStringWith(v, getWatchingListRequestStruct)
  | GetBillboard(v) => S.serializeToJsonStringWith(v, getBillboardRequestStruct)
  | GetSummary(v) => S.serializeToJsonStringWith(v, getSummaryRequestStruct)
  | GetLuckList(v) => S.serializeToJsonStringWith(v, getLuckListRequestStruct)
  | GetPlayback(v) => S.serializeToJsonStringWith(v, getPlaybackRequestStruct)
  | GetAllGiftList(v) => S.serializeToJsonStringWith(v, makeEmptyRequestStruct(GetAllGiftList))
  | GetWalletBalance(v) => S.serializeToJsonStringWith(v, makeEmptyRequestStruct(GetWalletBalance))
  | GetUserLiveInfo(v) => S.serializeToJsonStringWith(v, getUserLiveInfoRequestStruct)
  | GetAllLiveList(v) => S.serializeToJsonStringWith(v, makeEmptyRequestStruct(GetAllLiveList))
  | GetLiveData(v) => S.serializeToJsonStringWith(v, getLiveDataRequestStruct)
  | GetGiftList(v) => S.serializeToJsonStringWith(v, getGiftListRequestStruct)
  | GetUserInfo(v) => S.serializeToJsonStringWith(v, getUserInfoRequestStruct)
  | GetLiveCutInfo(v) => S.serializeToJsonStringWith(v, getLiveCutInfoRequestStruct)
  | GetManagerList(v) => S.serializeToJsonStringWith(v, makeEmptyRequestStruct(GetManagerList))
  | AddManager(v) => S.serializeToJsonStringWith(v, addManagerRequestStruct)
  | DeleteManager(v) => S.serializeToJsonStringWith(v, deleteManagerRequestStruct)
  | GetAllKickHistory(v) => S.serializeToJsonStringWith(v, getAllKickHistoryRequestStruct)
  | ManagerKick(v) => S.serializeToJsonStringWith(v, managerKickRequestStruct)
  | AuthorKick(v) => S.serializeToJsonStringWith(v, authorKickRequestStruct)
  | GetMedalDetail(v) => S.serializeToJsonStringWith(v, getMedalDetailRequestStruct)
  | GetMedalList(v) => S.serializeToJsonStringWith(v, makeEmptyRequestStruct(GetMedalList))
  | GetMedalRankList(v) => S.serializeToJsonStringWith(v, getMedalRankListRequestStruct)
  | GetUserMedal(v) => S.serializeToJsonStringWith(v, getUserMedalRequestStruct)
  | WearMedal(v) => S.serializeToJsonStringWith(v, wearMedalRequestStruct)
  | CancelWearMedal(v) => S.serializeToJsonStringWith(v, makeEmptyRequestStruct(CancelWearMedal))
  | CheckLiveAuth(v) => S.serializeToJsonStringWith(v, makeEmptyRequestStruct(CheckLiveAuth))
  | GetLiveTypeList(v) => S.serializeToJsonStringWith(v, makeEmptyRequestStruct(GetLiveTypeList))
  | GetPushConfig(v) => S.serializeToJsonStringWith(v, makeEmptyRequestStruct(GetPushConfig))
  | GetLiveStatus(v) => S.serializeToJsonStringWith(v, makeEmptyRequestStruct(GetLiveStatus))
  | GetTranscodeInfo(v) => S.serializeToJsonStringWith(v, getTranscodeInfoRequestStruct)
  | StartLive(v) => S.serializeToJsonStringWith(v, startLiveRequestStruct)
  | StopLive(v) => S.serializeToJsonStringWith(v, stopLiveRequestStruct)
  | ChangeTitleAndCover(v) => S.serializeToJsonStringWith(v, changeTitleAndCoverRequestStruct)
  | GetLiveCutStatus(v) => S.serializeToJsonStringWith(v, makeEmptyRequestStruct(GetLiveCutStatus))
  | SetLiveCutStatus(v) => S.serializeToJsonStringWith(v, setLiveCutStatusRequestStruct)
  }

let responseTypeStruct = S.int->S.variant(v => v->intToResponseType)

let responseResultStruct = S.int->S.variant(v => v->intToResponseResult)

let loginResponseStruct = S.object(s => s.field("tokenInfo", tokenInfoStruct))

let streamURLStruct = S.object(s => {
  url: s.field("url", S.string),
  bitrate: s.field("bitrate", S.int),
  qualityType: s.field("qualityType", S.string),
  qualityName: s.field("qualityName", S.string),
})

let streamInfoStruct = S.object(s => {
  liveID: s.field("liveID", S.string),
  title: s.field("title", S.string),
  liveStartTime: s.field("liveStartTime", S.float),
  panoramic: s.field("panoramic", S.bool),
  streamList: s.field("streamList", S.array(streamURLStruct)),
  streamName: s.field("streamName", S.string),
})

let getDanmakuResponse = S.object(s => s.field("StreamInfo", streamInfoStruct))

let medalInfoStruct = S.object(s => {
  uperID: s.field("uperID", S.int),
  userID: s.field("userID", S.int),
  clubName: s.field("clubName", S.string),
  level: s.field("level", S.int),
})

let userInfoStruct = S.object(s => {
  userID: s.field("userID", S.float),
  nickname: s.field("nickname", S.string),
  avatar: s.field("avatar", S.string),
  medal: s.field("medal", medalInfoStruct),
  managerType: s.field("managerType", S.int->S.variant(v => v->intToManagerType)),
})

let watchingUserStruct = S.object(s => {
  userInfo: s.field("userInfo", userInfoStruct),
  anonymousUser: s.field("anonymousUser", S.bool),
  displaySendAmount: s.field("displaySendAmount", S.string),
  customData: s.field("customData", S.string),
})

let getWatchingListResponseStruct = S.array(watchingUserStruct)

let getBillboardResponseStruct = S.array(watchingUserStruct)

let getSummaryResponseStruct = S.object(s => {
  duration: s.field("duration", S.int),
  likeCount: s.field("likeCount", S.string),
  watchCount: s.field("watchCount", S.string),
  giftCount: s.field("giftCount", S.int),
  diamondCount: s.field("diamondCount", S.int),
  bananaCount: s.field("bananaCount", S.int),
})

let luckyUserStruct = S.object(s => {
  userInfo: s.field("userInfo", userInfoStruct),
  grabAmount: s.field("grabAmount", S.int),
})

let getLuckListResponseStruct = S.array(luckyUserStruct)

let getPlaybackResponseStruct = S.object(s => {
  duration: s.field("duration", S.int),
  url: s.field("url", S.string),
  backupURL: s.field("backupURL", S.string),
  m3u8Slice: s.field("m3u8Slice", S.string),
  width: s.field("width", S.int),
  height: s.field("height", S.int),
})

let giftDetailStruct = S.object(s => {
  giftID: s.field("giftID", S.int),
  giftName: s.field("giftName", S.string),
  arLiveName: s.field("arLiveName", S.string),
  payWalletType: s.field("payWalletType", S.int->S.variant(v => v->intToGiftPayType)),
  price: s.field("price", S.int),
  webpPic: s.field("webpPic", S.string),
  pngPic: s.field("pngPic", S.string),
  smallPngPic: s.field("smallPngPic", S.string),
  allowBatchSendSizeList: ?s.field("allowBatchSendSizeList", S.null(S.array(S.int))),
  canCombo: s.field("canCombo", S.bool),
  canDraw: s.field("canDraw", S.bool),
  magicFaceID: s.field("magicFaceID", S.int),
  vupArID: s.field("vupArID", S.int),
  description: s.field("description", S.string),
  redpackPrice: s.field("redpackPrice", S.int),
  cornerMarkerText: s.field("cornerMarkerText", S.string),
})

let getAllGiftListResponseStruct = S.array(giftDetailStruct)

let getWalletBalanceResponseStruct = S.object(s => {
  acCoin: s.field("acCoin", S.int),
  banana: s.field("banana", S.int),
})

let userProfileStruct = S.object(s => {
  userID: s.field("userID", S.int),
  nickname: s.field("nickname", S.string),
  avatar: s.field("avatar", S.string),
  avatarFrame: s.field("avatarFrame", S.string),
  followingCount: s.field("followingCount", S.int),
  fansCount: s.field("fansCount", S.int),
  contributeCount: s.field("contributeCount", S.int),
  signature: s.field("signature", S.string),
  verifiedText: s.field("verifiedText", S.string),
  isJoinUpCollege: s.field("isJoinUpCollege", S.bool),
  isFollowing: s.field("isFollowing", S.bool),
  isFollowed: s.field("isFollowed", S.bool),
})

let liveTypeStruct = S.object(s => {
  categoryID: s.field("categoryID", S.int),
  categoryName: s.field("categoryName", S.string),
  subCategoryID: s.field("subCategoryID", S.int),
  subCategoryName: s.field("subCategoryName", S.string),
})

let userLiveInfoStruct = S.object(s => {
  profile: s.field("profile", userProfileStruct),
  liveType: s.field("liveType", liveTypeStruct),
  liveID: s.field("liveID", S.string),
  streamName: s.field("streamName", S.string),
  title: s.field("title", S.string),
  liveStartTime: s.field("liveStartTime", S.float),
  portrait: s.field("portrait", S.bool),
  panoramic: s.field("panoramic", S.bool),
  liveCover: s.field("liveCover", S.string),
  onlineCount: s.field("onlineCount", S.int),
  likeCount: s.field("likeCount", S.int),
  hasFansClub: s.field("hasFansClub", S.bool),
  disableDanmakuShow: s.field("disableDanmakuShow", S.bool),
  paidShowUserBuyStatus: s.field("paidShowUserBuyStatus", S.bool),
})

let getUserLiveInfoResponseStruct = userLiveInfoStruct

let getAllLiveListResponseStruct = S.array(userLiveInfoStruct)

let liveStatStruct = S.object(s => {
  duration: s.field("duration", S.int),
  maxPopularityValue: s.field("maxPopularityValue", S.int),
  watchCount: s.field("watchCount", S.int),
  diamondCount: s.field("diamondCount", S.int),
  commentCount: s.field("commentCount", S.int),
  bananaCount: s.field("bananaCount", S.int),
})

let liveDetailStruct = S.object(s => {
  liveStartTime: s.field("liveStartTime", S.float),
  liveEndTime: s.field("liveEndTime", S.float),
  liveStat: s.field("liveStat", liveStatStruct),
})

let dailyDataStruct = S.object(s => {
  date: s.field("date", S.string),
  liveTimes: s.field("liveTimes", S.int),
  liveStat: s.field("liveStat", liveStatStruct),
})

let getLiveDataResponseStruct = S.object(s => {
  beginDate: s.field("beginDate", S.string),
  endDate: s.field("endDate", S.string),
  overview: s.field("overview", liveStatStruct),
  liveDetail: s.field("liveDetail", S.dict(liveDetailStruct)),
  dailyData: ?s.field("dailyData", S.null(S.array(dailyDataStruct))),
})

let getGiftListResponseStruct = S.array(giftDetailStruct)

let getUserInfoResponseStruct = S.object(s => {
  userID: s.field("userID", S.int),
  nickname: s.field("nickname", S.string),
  avatar: s.field("avatar", S.string),
  avatarFrame: s.field("avatarFrame", S.string),
  followingCount: s.field("followingCount", S.string),
  fansCount: s.field("fansCount", S.string),
  contributeCount: s.field("contributeCount", S.string),
  signature: s.field("signature", S.string),
  verifiedText: s.field("verifiedText", S.string),
  isJoinUpCollege: s.field("isJoinUpCollege", S.bool),
  isFollowing: s.field("isFollowing", S.bool),
  isFollowed: s.field("isFollowed", S.bool),
  liveID: s.field("liveID", S.string),
  likeCount: s.field("likeCount", S.int),
})

let getLiveCutInfoResponseStruct = S.object(s => {
  status: s.field("status", S.bool),
  url: s.field("url", S.string),
  redirectURL: s.field("redirectURL", S.string),
})

let managerStruct = S.object(s => {
  userInfo: s.field("userInfo", userInfoStruct),
  customData: s.field("customData", S.string),
  online: s.field("online", S.bool),
})

let getManagerListResponseStruct = S.array(managerStruct)

let kickHistoryStruct = S.object(s => {
  userID: s.field("userID", S.int),
  nickname: s.field("nickname", S.string),
  kickTime: s.field("kickTime", S.float),
})

let getAllKickHistoryResponseStruct = S.array(kickHistoryStruct)

let medalStruct = S.object(s => {
  medalInfo: s.field("medalInfo", medalInfoStruct),
  uperName: s.field("uperName", S.string),
  uperAvatar: s.field("uperAvatar", S.string),
  wearMedal: s.field("wearMedal", S.bool),
  friendshipDegree: s.field("friendshipDegree", S.int),
  joinClubTime: s.field("joinClubTime", S.float),
  currentDegreeLimit: s.field("currentDegreeLimit", S.int),
  medalCount: s.field("medalCount", S.int),
})

let medalDegreeStruct = S.object(s => {
  uperID: s.field("uperID", S.int),
  giftDegree: s.field("giftDegree", S.int),
  giftDegreeLimit: s.field("giftDegreeLimit", S.int),
  peachDegree: s.field("peachDegree", S.int),
  peachDegreeLimit: s.field("peachDegreeLimit", S.int),
  liveWatchDegree: s.field("liveWatchDegree", S.int),
  liveWatchDegreeLimit: s.field("liveWatchDegreeLimit", S.int),
  bananaDegree: s.field("bananaDegree", S.int),
  bananaDegreeLimit: s.field("bananaDegreeLimit", S.int),
})

let getMedalDetailResponseStruct = S.object(s => {
  medal: s.field("medal", medalStruct),
  medalDegree: s.field("medalDegree", medalDegreeStruct),
  userRank: s.field("userRank", S.string),
})

let getMedalListResponseStruct = S.null(S.array(medalStruct))

let userMedalInfoStruct = S.object(s => {
  profile: s.field("profile", userProfileStruct),
  friendshipDegree: s.field("friendshipDegree", S.int),
  level: s.field("level", S.int),
})

let getMedalRankListResponseStruct = S.object(s => {
  hasFansClub: s.field("hasFansClub", S.bool),
  rankList: ?s.field("rankList", S.null(S.array(userMedalInfoStruct))),
  clubName: s.field("clubName", S.string),
  medalCount: s.field("medalCount", S.int),
  hasMedal: s.field("hasMedal", S.bool),
  userFriendshipDegree: s.field("userFriendshipDegree", S.int),
  userRank: s.field("userRank", S.string),
})

let getUserMedalResponseStruct = medalStruct

let checkLiveAuthResponseStruct = S.object(s => {liveAuth: s.field("liveAuth", S.bool)})

let getLiveTypeListResponseStruct = liveTypeStruct

let getPushConfigResponseStruct = S.object(s => {
  streamName: s.field("streamName", S.string),
  streamPullAddress: s.field("streamPullAddress", S.string),
  streamPushAddress: ?s.field("streamPushAddress", S.null(S.array(S.string))),
  panoramic: s.field("panoramic", S.bool),
  interval: s.field("interval", S.int),
  rtmpServer: s.field("rtmpServer", S.string),
  streamKey: s.field("streamKey", S.string),
})

let getLiveStatusResponseStruct = S.object(s => {
  liveID: s.field("liveID", S.string),
  streamName: s.field("streamName", S.string),
  title: s.field("title", S.string),
  liveCover: s.field("liveCover", S.string),
  liveStartTime: s.field("liveStartTime", S.float),
  panoramic: s.field("panoramic", S.bool),
  bizUnit: s.field("bizUnit", S.string),
  bizCustomData: s.field("bizCustomData", S.string),
})

let transcodeInfoStruct = S.object(s => {
  streamURL: s.field("streamURL", streamURLStruct),
  resolution: s.field("resolution", S.string),
  frameRate: s.field("frameRate", S.int),
  template: s.field("template", S.string),
})

let getTranscodeInfoResponseStruct = S.array(transcodeInfoStruct)

let startLiveResponseStruct = liveIDStruct

let stopLiveResponseStruct = S.object(s => {
  duration: s.field("duration", S.int),
  endReason: s.field("endReason", S.string),
})

let getLiveCutStatusResponseStruct = canCutLiveStruct

let danmuInfoStruct = S.object(s => {
  sendTime: s.field("sendTime", S.float),
  userInfo: s.field("userInfo", userInfoStruct),
})

let commentStruct = S.object(s => {
  danmuInfo: s.field("danmuInfo", danmuInfoStruct),
  content: s.field("content", S.string),
})

let throwBananaStruct = S.object(s => {
  danmuInfo: s.field("danmuInfo", danmuInfoStruct),
  bananaCount: s.field("bananaCount", S.int),
})

let drawPointStruct = S.object(s => {
  marginLeft: s.field("marginLeft", S.int),
  marginTop: s.field("marginTop", S.int),
  scaleRatio: s.field("scaleRatio", S.int),
  handup: s.field("handup", S.bool),
  pointWidth: s.field("pointWidth", S.int),
  pointHeight: s.field("pointHeight", S.int),
})

let drawGiftInfoStruct = S.object(s => {
  screenWidth: s.field("screenWidth", S.int),
  screenHeight: s.field("screenHeight", S.int),
  drawPoint: ?s.field("drawPoint", S.null(S.array(drawPointStruct))),
})

let giftStruct = S.object(s => {
  danmuInfo: s.field("danmuInfo", danmuInfoStruct),
  giftDetail: s.field("giftDetail", giftDetailStruct),
  count: s.field("count", S.int),
  combo: s.field("combo", S.int),
  value: s.field("value", S.int),
  comboID: s.field("comboID", S.string),
  slotDisplayDuration: s.field("slotDisplayDuration", S.int),
  expireDuration: s.field("expireDuration", S.int),
  drawGiftInfo: s.field("drawGiftInfo", drawGiftInfoStruct),
})

let richTextUserInfoStruct = S.object(s => {
  userInfo: s.field("userInfo", userInfoStruct),
  color: s.field("color", S.string),
})

let richTextPlainStruct = S.object(s => {
  text: s.field("text", S.string),
  color: s.field("color", S.string),
})

let richTextImageStruct = S.object(s => {
  pictures: s.field("pictures", S.array(S.string)),
  alternativeText: s.field("alternativeText", S.string),
  alternativeColor: s.field("alternativeColor", S.string),
})

let richTextSegmentStruct = S.union([
  S.object(s => {
    s.tag("type", 1900)
    UserInfo({segment: s.field("segment", richTextUserInfoStruct)})
  }),
  S.object(s => {
    s.tag("type", 1901)
    Plain({segment: s.field("segment", richTextPlainStruct)})
  }),
  S.object(s => {
    s.tag("type", 1902)
    Image({segment: s.field("segment", richTextImageStruct)})
  }),
])

let richTextStruct = S.object(s => {
  sendTime: s.field("sendTime", S.float),
  segments: s.field("segments", S.array(richTextSegmentStruct)),
})

let joinClubStruct = S.object(s => {
  joinTime: s.field("joinTime", S.float),
  fansInfo: s.field("fansInfo", userInfoStruct),
  uperInfo: s.field("uperInfo", userInfoStruct),
})

let shareLiveStruct = S.object(s => {
  danmuInfo: s.field("danmuInfo", danmuInfoStruct),
  sharePlatform: s.field("sharePlatform", S.int->S.variant(v => v->intToSharePlatformType)),
  sharePlatformIcon: s.field("sharePlatformIcon", S.string),
})

let bananaCountStruct = S.object(s => {
  bananaCount: s.field("bananaCount", S.string),
})

let displayInfoStruct = S.object(s => {
  watchingCount: s.field("watchingCount", S.string),
  likeCount: s.field("likeCount", S.string),
  likeDelta: s.field("likeDelta", S.int),
})

let watchingUserStruct = S.object(s => {
  userInfo: s.field("userInfo", userInfoStruct),
  anonymousUser: s.field("anonymousUser", S.bool),
  displaySendAmount: s.field("displaySendAmount", S.string),
  customData: s.field("customData", S.string),
})

let topUsersStruct = S.array(watchingUserStruct)

let recentCommentsStruct = S.array(commentStruct)

let redpackStruct = S.object(s => {
  userInfo: s.field("userInfo", userInfoStruct),
  displayStatus: s.field("displayStatus", S.int->S.variant(v => v->intToRedpackDisplayStatus)),
  grabBeginTime: s.field("grabBeginTime", S.float),
  getTokenLatestTime: s.field("getTokenLatestTime", S.float),
  redpackID: s.field("redpackID", S.string),
  redpackBizUnit: s.field("redpackBizUnit", S.string),
  redpackAmount: s.field("redpackAmount", S.int),
  settleBeginTime: s.field("settleBeginTime", S.float),
})

let redpackListStruct = S.array(redpackStruct)

let chatCallStruct = S.object(s => {
  chatID: s.field("chatID", S.string),
  liveID: s.field("liveID", S.string),
  callTime: s.field("callTime", S.float),
})

let chatAcceptStruct = S.object(s => {
  chatID: s.field("chatID", S.string),
  mediaType: s.field("mediaType", S.int->S.variant(v => v->intToChatMediaType)),
  signalInfo: s.field("signalInfo", S.string),
})

let chatReadyStruct = S.object(s => {
  chatID: s.field("chatID", S.string),
  guest: s.field("guest", userInfoStruct),
  mediaType: s.field("mediaType", S.int->S.variant(v => v->intToChatMediaType)),
})

let chatEndStruct = S.object(s => {
  chatID: s.field("chatID", S.string),
  endType: s.field("endType", S.int->S.variant(v => v->intToChatEndType)),
})

let danmakuStopErrorStruct = S.object(s => {error: s.field("error", S.string)})

let kickedOutStruct = S.object(s => {
  kickedOutReason: s.field("kickedOutReason", S.string),
})

let violationAlertStruct = S.object(s => {
  violationContent: s.field("violationContent", S.string),
})

let managerStateStruct = S.object(s => {
  managerState: s.field("managerState", S.int->S.variant(v => v->intToManagerStateType)),
})

type responseModel = {
  type_: responseType,
  liverUID: int,
  requestID: string,
  result: responseResult,
  error: string,
}

let responseModelStruct = S.object(s => {
  type_: s.field("type", responseTypeStruct),
  liverUID: s.fieldOr("liverUID", S.int, 0),
  requestID: s.fieldOr("requestID", S.string, ""),
  result: s.fieldOr("result", responseResultStruct, UnknownResult(0)),
  error: s.fieldOr("error", S.string, ""),
})

let makeEmptyResponseData = (
  s: S.effectCtx<responseData>,
  {requestID, result, error},
  constructor,
) =>
  switch result {
  | Success => constructor(Ok({requestID: requestID}))
  | JsonParseError | InvalidRequestType | InvalidRequestData | HandleRequestError | NeedLogin =>
    constructor(Error({requestID, result, error}))
  | UnknownResult(n) => s.fail(`unknown result type: ${n->Int.toString}`)
  }

let makeResponseData = (
  s: S.effectCtx<responseData>,
  data,
  {requestID, result, error},
  struct,
  constructor,
) =>
  switch result {
  | Success =>
    switch data->S.parseAnyWith(S.object(s => s.field("data", struct))) {
    | Ok(d) => {
        let message: message<'b> = {requestID, data: d}
        constructor(Ok(message))
      }
    | Error(e) => s.failWithError(e)
    }
  | JsonParseError | InvalidRequestType | InvalidRequestData | HandleRequestError | NeedLogin =>
    constructor(Error({requestID, result, error}))
  | UnknownResult(n) => s.fail(`unknown result type: ${n->Int.toString}`)
  }

let makeOptionalResponseData = (
  s: S.effectCtx<responseData>,
  data,
  {requestID, result, error},
  struct,
  constructor,
) =>
  switch result {
  | Success =>
    switch data->S.parseAnyWith(S.object(s => s.field("data", S.option(struct)))) {
    | Ok(Some(d)) => constructor(Ok({requestID, data: d}))
    | Ok(None) => constructor(Ok({requestID: requestID}))
    | Error(e) => s.failWithError(e)
    }
  | JsonParseError | InvalidRequestType | InvalidRequestData | HandleRequestError | NeedLogin =>
    constructor(Error({requestID, result, error}))
  | UnknownResult(n) => s.fail(`unknown result type: ${n->Int.toString}`)
  }

let makeEmptyDanmakuData = (s: S.effectCtx<responseData>, {liverUID}, constructor) =>
  if liverUID > 0 {
    let danmaku: emptyDanmaku = {liverUID: liverUID}
    constructor(danmaku)
  } else {
    s.fail("missing liverUID or illegal liverUID")
  }

let makeDanmakuData = (s: S.effectCtx<responseData>, data, {liverUID}, struct, constructor) =>
  if liverUID > 0 {
    switch data->S.parseAnyWith(S.object(s => s.field("data", struct))) {
    | Ok(d) => constructor({liverUID, data: d})
    | Error(e) => s.failWithError(e)
    }
  } else {
    s.fail("missing liverUID or illegal liverUID")
  }

let responseDataStruct = S.custom("responseData", s => {
  parser: data => {
    switch data->S.parseAnyWith(responseModelStruct) {
    | Ok(model) =>
      switch model.type_ {
      | Heartbeat => Heartbeat
      | Login => makeResponseData(s, data, model, loginResponseStruct, v => Login(v))
      | SetClientID => makeEmptyResponseData(s, model, v => SetClientID(v))
      | RequestForward => makeEmptyResponseData(s, model, v => RequestForward(v))
      | ReceiveForward =>
        makeResponseData(s, data, model, forwardDataStruct, v => ReceiveForward(v))
      | SetToken => makeEmptyResponseData(s, model, v => SetToken(v))
      | GetDanmaku =>
        makeOptionalResponseData(s, data, model, getDanmakuResponse, v => GetDanmaku(v))
      | StopDanmaku => makeEmptyResponseData(s, model, v => StopDanmaku(v))
      | GetWatchingList =>
        makeResponseData(s, data, model, getWatchingListResponseStruct, v => GetWatchingList(v))
      | GetBillboard =>
        makeResponseData(s, data, model, getBillboardResponseStruct, v => GetBillboard(v))
      | GetSummary => makeResponseData(s, data, model, getSummaryResponseStruct, v => GetSummary(v))
      | GetLuckList =>
        makeResponseData(s, data, model, getLuckListResponseStruct, v => GetLuckList(v))
      | GetPlayback =>
        makeResponseData(s, data, model, getPlaybackResponseStruct, v => GetPlayback(v))
      | GetAllGiftList =>
        makeResponseData(s, data, model, getAllGiftListResponseStruct, v => GetAllGiftList(v))
      | GetWalletBalance =>
        makeResponseData(s, data, model, getWalletBalanceResponseStruct, v => GetWalletBalance(v))
      | GetUserLiveInfo =>
        makeResponseData(s, data, model, getUserLiveInfoResponseStruct, v => GetUserLiveInfo(v))
      | GetAllLiveList =>
        makeResponseData(s, data, model, getAllLiveListResponseStruct, v => GetAllLiveList(v))
      | GetLiveData =>
        makeResponseData(s, data, model, getLiveDataResponseStruct, v => GetLiveData(v))
      | GetGiftList =>
        makeResponseData(s, data, model, getGiftListResponseStruct, v => GetGiftList(v))
      | GetUserInfo =>
        makeResponseData(s, data, model, getUserInfoResponseStruct, v => GetUserInfo(v))
      | GetLiveCutInfo =>
        makeResponseData(s, data, model, getLiveCutInfoResponseStruct, v => GetLiveCutInfo(v))
      | GetManagerList =>
        makeResponseData(s, data, model, getManagerListResponseStruct, v => GetManagerList(v))
      | AddManager => makeEmptyResponseData(s, model, v => AddManager(v))
      | DeleteManager => makeEmptyResponseData(s, model, v => DeleteManager(v))
      | GetAllKickHistory =>
        makeResponseData(s, data, model, getAllKickHistoryResponseStruct, v => GetAllKickHistory(v))
      | ManagerKick => makeEmptyResponseData(s, model, v => ManagerKick(v))
      | AuthorKick => makeEmptyResponseData(s, model, v => AuthorKick(v))
      | GetMedalDetail =>
        makeResponseData(s, data, model, getMedalDetailResponseStruct, v => GetMedalDetail(v))
      | GetMedalList =>
        makeResponseData(s, data, model, getMedalListResponseStruct, v => GetMedalList(v))
      | GetMedalRankList =>
        makeResponseData(s, data, model, getMedalRankListResponseStruct, v => GetMedalRankList(v))
      | GetUserMedal =>
        makeResponseData(s, data, model, getUserMedalResponseStruct, v => GetUserMedal(v))
      | WearMedal => makeEmptyResponseData(s, model, v => WearMedal(v))
      | CancelWearMedal => makeEmptyResponseData(s, model, v => CancelWearMedal(v))
      | CheckLiveAuth =>
        makeResponseData(s, data, model, checkLiveAuthResponseStruct, v => CheckLiveAuth(v))
      | GetLiveTypeList =>
        makeResponseData(s, data, model, getLiveTypeListResponseStruct, v => GetLiveTypeList(v))
      | GetPushConfig =>
        makeResponseData(s, data, model, getPushConfigResponseStruct, v => GetPushConfig(v))
      | GetLiveStatus =>
        makeResponseData(s, data, model, getLiveStatusResponseStruct, v => GetLiveStatus(v))
      | GetTranscodeInfo =>
        makeResponseData(s, data, model, getTranscodeInfoResponseStruct, v => GetTranscodeInfo(v))
      | StartLive => makeResponseData(s, data, model, startLiveResponseStruct, v => StartLive(v))
      | StopLive => makeResponseData(s, data, model, stopLiveResponseStruct, v => StopLive(v))
      | ChangeTitleAndCover => makeEmptyResponseData(s, model, v => ChangeTitleAndCover(v))
      | GetLiveCutStatus =>
        makeResponseData(s, data, model, getLiveCutStatusResponseStruct, v => GetLiveCutStatus(v))
      | SetLiveCutStatus => makeEmptyResponseData(s, model, v => SetLiveCutStatus(v))
      | Comment => makeDanmakuData(s, data, model, commentStruct, v => Comment(v))
      | Like => makeDanmakuData(s, data, model, danmuInfoStruct, v => Like(v))
      | EnterRoom => makeDanmakuData(s, data, model, danmuInfoStruct, v => EnterRoom(v))
      | FollowAuthor => makeDanmakuData(s, data, model, danmuInfoStruct, v => FollowAuthor(v))
      | ThrowBanana => makeDanmakuData(s, data, model, throwBananaStruct, v => ThrowBanana(v))
      | Gift => makeDanmakuData(s, data, model, giftStruct, v => Gift(v))
      | RichText => makeDanmakuData(s, data, model, richTextStruct, v => RichText(v))
      | JoinClub => makeDanmakuData(s, data, model, joinClubStruct, v => JoinClub(v))
      | ShareLive => makeDanmakuData(s, data, model, shareLiveStruct, v => ShareLive(v))
      | DanmakuStop => makeEmptyDanmakuData(s, model, v => DanmakuStop(v))
      | BananaCount => makeDanmakuData(s, data, model, bananaCountStruct, v => BananaCount(v))
      | DisplayInfo => makeDanmakuData(s, data, model, displayInfoStruct, v => DisplayInfo(v))
      | TopUsers => makeDanmakuData(s, data, model, topUsersStruct, v => TopUsers(v))
      | RecentComments =>
        makeDanmakuData(s, data, model, recentCommentsStruct, v => RecentComments(v))
      | RedpackList => makeDanmakuData(s, data, model, redpackListStruct, v => RedpackList(v))
      | ChatCall => makeDanmakuData(s, data, model, chatCallStruct, v => ChatCall(v))
      | ChatAccept => makeDanmakuData(s, data, model, chatAcceptStruct, v => ChatAccept(v))
      | ChatReady => makeDanmakuData(s, data, model, chatReadyStruct, v => ChatReady(v))
      | ChatEnd => makeDanmakuData(s, data, model, chatEndStruct, v => ChatEnd(v))
      | DanmakuStopError =>
        makeDanmakuData(s, data, model, danmakuStopErrorStruct, v => DanmakuStopError(v))
      | KickedOut => makeDanmakuData(s, data, model, kickedOutStruct, v => KickedOut(v))
      | ViolationAlert =>
        makeDanmakuData(s, data, model, violationAlertStruct, v => ViolationAlert(v))
      | ManagerState => makeDanmakuData(s, data, model, managerStateStruct, v => ManagerState(v))
      | UnknownResponse(v) => s.fail(`unsupported message type: ${v->Int.toString}`)
      }
    | Error(e) => s.failWithError(e)
    }
  },
})

let parseResponse = response => response->S.parseJsonStringWith(responseDataStruct)
