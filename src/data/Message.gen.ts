/* TypeScript file generated from Message.res by genType. */
/* eslint-disable import/first */


// tslint:disable-next-line:interface-over-type-literal
export type responseResult = 
    "Success"
  | "JsonParseError"
  | "InvalidRequestType"
  | "InvalidRequestData"
  | "HandleRequestError"
  | "NeedLogin"
  | { TAG: "UnknownResult"; _0: number };

// tslint:disable-next-line:interface-over-type-literal
export type message<a> = { readonly requestID: string; readonly data: a };

// tslint:disable-next-line:interface-over-type-literal
export type emptyMessage = { readonly requestID: string };

// tslint:disable-next-line:interface-over-type-literal
export type optionalMessage<a> = { readonly requestID: string; readonly data?: a };

// tslint:disable-next-line:interface-over-type-literal
export type error = {
  readonly requestID: string; 
  readonly result: responseResult; 
  readonly error: string
};

// tslint:disable-next-line:interface-over-type-literal
export type danmaku<a> = { readonly liverUID: number; readonly data: a };

// tslint:disable-next-line:interface-over-type-literal
export type emptyDanmaku = { readonly liverUID: number };

// tslint:disable-next-line:interface-over-type-literal
export type loginRequest = { readonly account: string; readonly password: string };

// tslint:disable-next-line:interface-over-type-literal
export type tokenInfo = {
  readonly userID: number; 
  readonly securityKey: string; 
  readonly serviceToken: string; 
  readonly deviceID: string; 
  readonly cookies: string[]
};

// tslint:disable-next-line:interface-over-type-literal
export type loginResponse = tokenInfo;

// tslint:disable-next-line:interface-over-type-literal
export type setClientIDRequest = { readonly clientID: string };

// tslint:disable-next-line:interface-over-type-literal
export type forwardData = { readonly clientID: string; readonly message: string };

// tslint:disable-next-line:interface-over-type-literal
export type requestForwardRequest = forwardData;

// tslint:disable-next-line:interface-over-type-literal
export type receiveForwardResponse = forwardData;

// tslint:disable-next-line:interface-over-type-literal
export type setTokenRequest = tokenInfo;

// tslint:disable-next-line:interface-over-type-literal
export type liverUID = { readonly liverUID: number };

// tslint:disable-next-line:interface-over-type-literal
export type getDanmakuRequest = liverUID;

// tslint:disable-next-line:interface-over-type-literal
export type streamURL = {
  readonly url: string; 
  readonly bitrate: number; 
  readonly qualityType: string; 
  readonly qualityName: string
};

// tslint:disable-next-line:interface-over-type-literal
export type streamInfo = {
  readonly liveID: string; 
  readonly title: string; 
  readonly liveStartTime: number; 
  readonly panoramic: boolean; 
  readonly streamList: streamURL[]; 
  readonly streamName: string
};

// tslint:disable-next-line:interface-over-type-literal
export type getDanmakuResponse = streamInfo;

// tslint:disable-next-line:interface-over-type-literal
export type stopDanmakuRequest = liverUID;

// tslint:disable-next-line:interface-over-type-literal
export type liveID = { readonly liveID: string };

// tslint:disable-next-line:interface-over-type-literal
export type getWatchingListRequest = liveID;

// tslint:disable-next-line:interface-over-type-literal
export type medalInfo = {
  readonly uperID: number; 
  readonly userID: number; 
  readonly clubName: string; 
  readonly level: number
};

// tslint:disable-next-line:interface-over-type-literal
export type managerType = 
    "NotManager"
  | "NormalManager"
  | { TAG: "UnknownManagerType"; _0: number };

// tslint:disable-next-line:interface-over-type-literal
export type userInfo = {
  readonly userID: number; 
  readonly nickname: string; 
  readonly avatar: string; 
  readonly medal: medalInfo; 
  readonly managerType: managerType
};

// tslint:disable-next-line:interface-over-type-literal
export type watchingUser = {
  readonly userInfo: userInfo; 
  readonly anonymousUser: boolean; 
  readonly displaySendAmount: string; 
  readonly customData: string
};

// tslint:disable-next-line:interface-over-type-literal
export type getWatchingListResponse = watchingUser[];

// tslint:disable-next-line:interface-over-type-literal
export type getBillboardRequest = liverUID;

// tslint:disable-next-line:interface-over-type-literal
export type getBillboardResponse = watchingUser[];

// tslint:disable-next-line:interface-over-type-literal
export type getSummaryRequest = liveID;

// tslint:disable-next-line:interface-over-type-literal
export type getSummaryResponse = {
  readonly duration: number; 
  readonly likeCount: string; 
  readonly watchCount: string; 
  readonly giftCount: number; 
  readonly diamondCount: number; 
  readonly bananaCount: number
};

// tslint:disable-next-line:interface-over-type-literal
export type getLuckListRequest = {
  readonly liveID: string; 
  readonly redpackID: string; 
  readonly redpackBizUnit: string
};

// tslint:disable-next-line:interface-over-type-literal
export type luckyUser = { readonly userInfo: userInfo; readonly grabAmount: number };

// tslint:disable-next-line:interface-over-type-literal
export type getLuckListResponse = luckyUser[];

// tslint:disable-next-line:interface-over-type-literal
export type getPlaybackRequest = liveID;

// tslint:disable-next-line:interface-over-type-literal
export type getPlaybackResponse = {
  readonly duration: number; 
  readonly url: string; 
  readonly backupURL: string; 
  readonly m3u8Slice: string; 
  readonly width: number; 
  readonly height: number
};

// tslint:disable-next-line:interface-over-type-literal
export type giftPayType = 
    "FreeGift"
  | "NonFreeGift"
  | { TAG: "UnknownGiftPayType"; _0: number };

// tslint:disable-next-line:interface-over-type-literal
export type giftDetail = {
  readonly giftID: number; 
  readonly giftName: string; 
  readonly arLiveName: string; 
  readonly payWalletType: giftPayType; 
  readonly price: number; 
  readonly webpPic: string; 
  readonly pngPic: string; 
  readonly smallPngPic: string; 
  readonly allowBatchSendSizeList?: number[]; 
  readonly canCombo: boolean; 
  readonly canDraw: boolean; 
  readonly magicFaceID: number; 
  readonly vupArID: number; 
  readonly description: string; 
  readonly redpackPrice: number; 
  readonly cornerMarkerText: string
};

// tslint:disable-next-line:interface-over-type-literal
export type getAllGiftListResponse = giftDetail[];

// tslint:disable-next-line:interface-over-type-literal
export type getWalletBalanceResponse = { readonly acCoin: number; readonly banana: number };

// tslint:disable-next-line:interface-over-type-literal
export type userID = { readonly userID: number };

// tslint:disable-next-line:interface-over-type-literal
export type getUserLiveInfoRequest = userID;

// tslint:disable-next-line:interface-over-type-literal
export type userProfile = {
  readonly userID: number; 
  readonly nickname: string; 
  readonly avatar: string; 
  readonly avatarFrame: string; 
  readonly followingCount: number; 
  readonly fansCount: number; 
  readonly contributeCount: number; 
  readonly signature: string; 
  readonly verifiedText: string; 
  readonly isJoinUpCollege: boolean; 
  readonly isFollowing: boolean; 
  readonly isFollowed: boolean
};

// tslint:disable-next-line:interface-over-type-literal
export type liveType = {
  readonly categoryID: number; 
  readonly categoryName: string; 
  readonly subCategoryID: number; 
  readonly subCategoryName: string
};

// tslint:disable-next-line:interface-over-type-literal
export type userLiveInfo = {
  readonly profile: userProfile; 
  readonly liveType: liveType; 
  readonly liveID: string; 
  readonly streamName: string; 
  readonly title: string; 
  readonly liveStartTime: number; 
  readonly portrait: boolean; 
  readonly panoramic: boolean; 
  readonly liveCover: string; 
  readonly onlineCount: number; 
  readonly likeCount: number; 
  readonly hasFansClub: boolean; 
  readonly disableDanmakuShow: boolean; 
  readonly paidShowUserBuyStatus: boolean
};

// tslint:disable-next-line:interface-over-type-literal
export type getUserLiveInfoResponse = userLiveInfo;

// tslint:disable-next-line:interface-over-type-literal
export type getAllLiveListResponse = userLiveInfo[];

// tslint:disable-next-line:interface-over-type-literal
export type getLiveDataRequest = { readonly days: number };

// tslint:disable-next-line:interface-over-type-literal
export type liveStat = {
  readonly duration: number; 
  readonly maxPopularityValue: number; 
  readonly watchCount: number; 
  readonly diamondCount: number; 
  readonly commentCount: number; 
  readonly bananaCount: number
};

// tslint:disable-next-line:interface-over-type-literal
export type liveDetail = {
  readonly liveStartTime: number; 
  readonly liveEndTime: number; 
  readonly liveStat: liveStat
};

// tslint:disable-next-line:interface-over-type-literal
export type dailyData = {
  readonly date: string; 
  readonly liveTimes: number; 
  readonly liveStat: liveStat
};

// tslint:disable-next-line:interface-over-type-literal
export type getLiveDataResponse = {
  readonly beginDate: string; 
  readonly endDate: string; 
  readonly overview: liveStat; 
  readonly liveDetail: {[id: string]: liveDetail}; 
  readonly dailyData: dailyData[]
};

// tslint:disable-next-line:interface-over-type-literal
export type getGiftListRequest = liveID;

// tslint:disable-next-line:interface-over-type-literal
export type getGiftListResponse = giftDetail[];

// tslint:disable-next-line:interface-over-type-literal
export type getUserInfoRequest = userID;

// tslint:disable-next-line:interface-over-type-literal
export type getUserInfoResponse = {
  readonly userID: number; 
  readonly nickname: string; 
  readonly avatar: string; 
  readonly avatarFrame: string; 
  readonly followingCount: string; 
  readonly fansCount: string; 
  readonly contributeCount: string; 
  readonly signature: string; 
  readonly verifiedText: string; 
  readonly isJoinUpCollege: boolean; 
  readonly isFollowing: boolean; 
  readonly isFollowed: boolean; 
  readonly liveID: string; 
  readonly likeCount: number
};

// tslint:disable-next-line:interface-over-type-literal
export type getLiveCutInfoRequest = { readonly liverUID: number; readonly liveID: string };

// tslint:disable-next-line:interface-over-type-literal
export type getLiveCutInfoResponse = {
  readonly status: boolean; 
  readonly url: string; 
  readonly redirectURL: string
};

// tslint:disable-next-line:interface-over-type-literal
export type manager = {
  readonly userInfo: userInfo; 
  readonly customData: string; 
  readonly online: boolean
};

// tslint:disable-next-line:interface-over-type-literal
export type getManagerListResponse = manager[];

// tslint:disable-next-line:interface-over-type-literal
export type managerUID = { readonly managerUID: number };

// tslint:disable-next-line:interface-over-type-literal
export type addManagerRequest = managerUID;

// tslint:disable-next-line:interface-over-type-literal
export type deleteManagerRequest = managerUID;

// tslint:disable-next-line:interface-over-type-literal
export type getAllKickHistoryRequest = liveID;

// tslint:disable-next-line:interface-over-type-literal
export type kickHistory = {
  readonly userID: number; 
  readonly nickname: string; 
  readonly kickTime: number
};

// tslint:disable-next-line:interface-over-type-literal
export type getAllKickHistoryResponse = kickHistory[];

// tslint:disable-next-line:interface-over-type-literal
export type kickUser = { readonly liveID: string; readonly kickedUID: number };

// tslint:disable-next-line:interface-over-type-literal
export type managerKickRequest = kickUser;

// tslint:disable-next-line:interface-over-type-literal
export type authorKickRequest = kickUser;

// tslint:disable-next-line:interface-over-type-literal
export type getMedalDetailRequest = liverUID;

// tslint:disable-next-line:interface-over-type-literal
export type medal = {
  readonly medalInfo: medalInfo; 
  readonly uperName: string; 
  readonly uperAvatar: string; 
  readonly wearMedal: boolean; 
  readonly friendshipDegree: number; 
  readonly joinClubTime: number; 
  readonly currentDegreeLimit: number; 
  readonly medalCount: number
};

// tslint:disable-next-line:interface-over-type-literal
export type medalDegree = {
  readonly uperID: number; 
  readonly giftDegree: number; 
  readonly giftDegreeLimit: number; 
  readonly peachDegree: number; 
  readonly peachDegreeLimit: number; 
  readonly liveWatchDegree: number; 
  readonly liveWatchDegreeLimit: number; 
  readonly bananaDegree: number; 
  readonly bananaDegreeLimit: number
};

// tslint:disable-next-line:interface-over-type-literal
export type getMedalDetailResponse = {
  readonly medal: medal; 
  readonly medalDegree: medalDegree; 
  readonly userRank: string
};

// tslint:disable-next-line:interface-over-type-literal
export type getMedalListResponse = medal[];

// tslint:disable-next-line:interface-over-type-literal
export type getMedalRankListRequest = liverUID;

// tslint:disable-next-line:interface-over-type-literal
export type userMedalInfo = {
  readonly profile: userProfile; 
  readonly friendshipDegree: number; 
  readonly level: number
};

// tslint:disable-next-line:interface-over-type-literal
export type getMedalRankListResponse = {
  readonly hasFansClub: boolean; 
  readonly rankList: userMedalInfo[]; 
  readonly clubName: string; 
  readonly medalCount: number; 
  readonly hasMedal: boolean; 
  readonly userFriendshipDegree: number; 
  readonly userRank: string
};

// tslint:disable-next-line:interface-over-type-literal
export type getUserMedalRequest = userID;

// tslint:disable-next-line:interface-over-type-literal
export type getUserMedalResponse = medal;

// tslint:disable-next-line:interface-over-type-literal
export type wearMedalRequest = liverUID;

// tslint:disable-next-line:interface-over-type-literal
export type checkLiveAuthResponse = { readonly liveAuth: boolean };

// tslint:disable-next-line:interface-over-type-literal
export type getLiveTypeListResponse = liveType;

// tslint:disable-next-line:interface-over-type-literal
export type getPushConfigResponse = {
  readonly streamName: string; 
  readonly streamPullAddress: string; 
  readonly streamPushAddress: string[]; 
  readonly panoramic: boolean; 
  readonly interval: number; 
  readonly rtmpServer: string; 
  readonly streamKey: string
};

// tslint:disable-next-line:interface-over-type-literal
export type getLiveStatusResponse = {
  readonly liveID: string; 
  readonly streamName: string; 
  readonly title: string; 
  readonly liveCover: string; 
  readonly liveStartTime: number; 
  readonly panoramic: boolean; 
  readonly bizUnit: string; 
  readonly bizCustomData: string
};

// tslint:disable-next-line:interface-over-type-literal
export type getTranscodeInfoRequest = { readonly streamName: string };

// tslint:disable-next-line:interface-over-type-literal
export type transcodeInfo = {
  readonly streamURL: streamURL; 
  readonly resolution: string; 
  readonly frameRate: number; 
  readonly template: string
};

// tslint:disable-next-line:interface-over-type-literal
export type getTranscodeInfoResponse = transcodeInfo[];

// tslint:disable-next-line:interface-over-type-literal
export type startLiveRequest = {
  readonly title: string; 
  readonly coverFile: string; 
  readonly streamName: string; 
  readonly portrait: boolean; 
  readonly panoramic: boolean; 
  readonly categoryID: number; 
  readonly subCategoryID: number
};

// tslint:disable-next-line:interface-over-type-literal
export type startLiveResponse = liveID;

// tslint:disable-next-line:interface-over-type-literal
export type stopLiveRequest = liveID;

// tslint:disable-next-line:interface-over-type-literal
export type stopLiveResponse = { readonly duration: number; readonly endReason: string };

// tslint:disable-next-line:interface-over-type-literal
export type changeTitleAndCoverRequest = {
  readonly title: string; 
  readonly coverFile: string; 
  readonly liveID: string
};

// tslint:disable-next-line:interface-over-type-literal
export type canCutLive = { readonly canCut: boolean };

// tslint:disable-next-line:interface-over-type-literal
export type getLiveCutStatusResponse = canCutLive;

// tslint:disable-next-line:interface-over-type-literal
export type setLiveCutStatusRequest = canCutLive;

// tslint:disable-next-line:interface-over-type-literal
export type danmuInfo = { readonly sendTime: number; readonly userInfo: userInfo };

// tslint:disable-next-line:interface-over-type-literal
export type comment = { readonly danmuInfo: danmuInfo; readonly content: string };

// tslint:disable-next-line:interface-over-type-literal
export type like = danmuInfo;

// tslint:disable-next-line:interface-over-type-literal
export type enterRoom = danmuInfo;

// tslint:disable-next-line:interface-over-type-literal
export type followAuthor = danmuInfo;

// tslint:disable-next-line:interface-over-type-literal
export type throwBanana = { readonly danmuInfo: danmuInfo; readonly bananaCount: number };

// tslint:disable-next-line:interface-over-type-literal
export type drawPoint = {
  readonly marginLeft: number; 
  readonly marginTop: number; 
  readonly scaleRatio: number; 
  readonly handup: boolean; 
  readonly pointWidth: number; 
  readonly pointHeight: number
};

// tslint:disable-next-line:interface-over-type-literal
export type drawGiftInfo = {
  readonly screenWidth: number; 
  readonly screenHeight: number; 
  readonly drawPoint?: drawPoint[]
};

// tslint:disable-next-line:interface-over-type-literal
export type gift = {
  readonly danmuInfo: danmuInfo; 
  readonly giftDetail: giftDetail; 
  readonly count: number; 
  readonly combo: number; 
  readonly value: number; 
  readonly comboID: string; 
  readonly slotDisplayDuration: number; 
  readonly expireDuration: number; 
  readonly drawGiftInfo: drawGiftInfo
};

// tslint:disable-next-line:interface-over-type-literal
export type richTextUserInfo = { readonly userInfo: userInfo; readonly color: string };

// tslint:disable-next-line:interface-over-type-literal
export type richTextPlain = { readonly text: string; readonly color: string };

// tslint:disable-next-line:interface-over-type-literal
export type richTextImage = {
  readonly pictures: string[]; 
  readonly alternativeText: string; 
  readonly alternativeColor: string
};

// tslint:disable-next-line:interface-over-type-literal
export type richTextSegment = 
    { TAG: "UserInfo"; readonly segment: richTextUserInfo }
  | { TAG: "Plain"; readonly segment: richTextPlain }
  | { TAG: "Image"; readonly segment: richTextImage };

// tslint:disable-next-line:interface-over-type-literal
export type richText = { readonly sendTime: number; readonly segments: richTextSegment[] };

// tslint:disable-next-line:interface-over-type-literal
export type joinClub = {
  readonly joinTime: number; 
  readonly fansInfo: userInfo; 
  readonly uperInfo: userInfo
};

// tslint:disable-next-line:interface-over-type-literal
export type sharePlatformType = 
    "QQ"
  | "Qzone"
  | "Weibo"
  | "WeChat"
  | "WeChatMoments"
  | "AcFunMoment"
  | { TAG: "UnknownPlatform"; _0: number };

// tslint:disable-next-line:interface-over-type-literal
export type shareLive = {
  readonly danmuInfo: danmuInfo; 
  readonly sharePlatform: sharePlatformType; 
  readonly sharePlatformIcon: string
};

// tslint:disable-next-line:interface-over-type-literal
export type bananaCount = { readonly bananaCount: string };

// tslint:disable-next-line:interface-over-type-literal
export type displayInfo = {
  readonly watchingCount: string; 
  readonly likeCount: string; 
  readonly likeDelta: number
};

// tslint:disable-next-line:interface-over-type-literal
export type topUsers = watchingUser[];

// tslint:disable-next-line:interface-over-type-literal
export type recentComments = comment[];

// tslint:disable-next-line:interface-over-type-literal
export type redpackDisplayStatus = 
    "RedpackShow"
  | "RedpackGetToken"
  | "RedpackGrab"
  | { TAG: "UnknownRedpackDisplayStatus"; _0: number };

// tslint:disable-next-line:interface-over-type-literal
export type redpack = {
  readonly userInfo: userInfo; 
  readonly displayStatus: redpackDisplayStatus; 
  readonly grabBeginTime: number; 
  readonly getTokenLatestTime: number; 
  readonly redpackID: string; 
  readonly redpackBizUnit: string; 
  readonly redpackAmount: number; 
  readonly settleBeginTime: number
};

// tslint:disable-next-line:interface-over-type-literal
export type redpackList = redpack[];

// tslint:disable-next-line:interface-over-type-literal
export type chatCall = {
  readonly chatID: string; 
  readonly liveID: string; 
  readonly callTime: number
};

// tslint:disable-next-line:interface-over-type-literal
export type chatMediaType = 
    "Audio"
  | "Video"
  | { TAG: "UnknownChatMediaType"; _0: number };

// tslint:disable-next-line:interface-over-type-literal
export type chatAccept = {
  readonly chatID: string; 
  readonly mediaType: chatMediaType; 
  readonly signalInfo: string
};

// tslint:disable-next-line:interface-over-type-literal
export type chatReady = {
  readonly chatID: string; 
  readonly guest: userInfo; 
  readonly mediaType: chatMediaType
};

// tslint:disable-next-line:interface-over-type-literal
export type chatEndType = 
    "CancelByAuthor"
  | "EndByAuthor"
  | "EndByGuest"
  | "GuestReject"
  | "GuestTimeout"
  | "GuestHeartbeatTimeout"
  | "AuthorHeartbeatTimeout"
  | "PeerLiveStopped"
  | { TAG: "UnknownChatEndType"; _0: number };

// tslint:disable-next-line:interface-over-type-literal
export type chatEnd = { readonly chatID: string; readonly endType: chatEndType };

// tslint:disable-next-line:interface-over-type-literal
export type danmakuStopError = { readonly error: string };

// tslint:disable-next-line:interface-over-type-literal
export type kickedOut = { readonly kickedOutReason: string };

// tslint:disable-next-line:interface-over-type-literal
export type violationAlert = { readonly violationContent: string };

// tslint:disable-next-line:interface-over-type-literal
export type managerStateType = 
    "NotManager"
  | "ManagerAdded"
  | "ManagerRemoved"
  | "IsManager"
  | { TAG: "UnknownManagerStateType"; _0: number };

// tslint:disable-next-line:interface-over-type-literal
export type managerState = { readonly managerState: managerStateType };
