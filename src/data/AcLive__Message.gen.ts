/* TypeScript file generated from AcLive__Message.res by genType. */

/* eslint-disable */
/* tslint:disable */

export type responseResult = 
    "Success"
  | "JsonParseError"
  | "InvalidRequestType"
  | "InvalidRequestData"
  | "HandleRequestError"
  | "NeedLogin"
  | { TAG: "UnknownResult"; _0: number };

export type message<a> = { readonly requestID: string; readonly data: a };

export type emptyMessage = { readonly requestID: string };

export type error = {
  readonly requestID: string; 
  readonly result: responseResult; 
  readonly error: string
};

export type danmaku<a> = { readonly liverUID: number; readonly data: a };

export type emptyDanmaku = { readonly liverUID: number };

export type loginRequest = { readonly account: string; readonly password: string };

export type tokenInfo = {
  readonly userID: number; 
  readonly securityKey: string; 
  readonly serviceToken: string; 
  readonly deviceID: string; 
  readonly cookies: string[]
};

export type loginResponse = tokenInfo;

export type setClientIDRequest = { readonly clientID: string };

export type forwardData = { readonly clientID: string; readonly message: string };

export type requestForwardRequest = forwardData;

export type receiveForwardResponse = forwardData;

export type setTokenRequest = tokenInfo;

export type liverUID = { readonly liverUID: number };

export type getDanmakuRequest = liverUID;

export type streamURL = {
  readonly url: string; 
  readonly bitrate: number; 
  readonly qualityType: string; 
  readonly qualityName: string
};

export type streamInfo = {
  readonly liveID: string; 
  readonly title: string; 
  readonly liveStartTime: number; 
  readonly panoramic: boolean; 
  readonly streamList: streamURL[]; 
  readonly streamName: string
};

export type getDanmakuResponse = { readonly liverUID: number; readonly streamInfo?: streamInfo };

export type stopDanmakuRequest = liverUID;

export type stopDanmakuResponse = liverUID;

export type liveID = { readonly liveID: string };

export type getWatchingListRequest = liveID;

export type medalInfo = {
  readonly uperID: number; 
  readonly userID: number; 
  readonly clubName: string; 
  readonly level: number
};

export type managerType = 
    "NotManager"
  | "NormalManager"
  | { TAG: "UnknownManagerType"; _0: number };

export type userInfo = {
  readonly userID: number; 
  readonly nickname: string; 
  readonly avatar: string; 
  readonly medal: medalInfo; 
  readonly managerType: managerType
};

export type watchingUser = {
  readonly userInfo: userInfo; 
  readonly anonymousUser: boolean; 
  readonly displaySendAmount: string; 
  readonly customData: string
};

export type getWatchingListResponse = watchingUser[];

export type getBillboardRequest = liverUID;

export type getBillboardResponse = watchingUser[];

export type getSummaryRequest = liveID;

export type getSummaryResponse = {
  readonly duration: number; 
  readonly likeCount: string; 
  readonly watchCount: string; 
  readonly giftCount: number; 
  readonly diamondCount: number; 
  readonly bananaCount: number
};

export type getLuckListRequest = {
  readonly liveID: string; 
  readonly redpackID: string; 
  readonly redpackBizUnit: string
};

export type luckyUser = { readonly userInfo: userInfo; readonly grabAmount: number };

export type getLuckListResponse = luckyUser[];

export type getPlaybackRequest = liveID;

export type getPlaybackResponse = {
  readonly duration: number; 
  readonly url: string; 
  readonly backupURL: string; 
  readonly m3u8Slice: string; 
  readonly width: number; 
  readonly height: number
};

export type giftPayType = 
    "FreeGift"
  | "NonFreeGift"
  | { TAG: "UnknownGiftPayType"; _0: number };

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

export type getAllGiftListResponse = giftDetail[];

export type getWalletBalanceResponse = { readonly acCoin: number; readonly banana: number };

export type userID = { readonly userID: number };

export type getUserLiveInfoRequest = userID;

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

export type liveType = {
  readonly categoryID: number; 
  readonly categoryName: string; 
  readonly subCategoryID: number; 
  readonly subCategoryName: string
};

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

export type getUserLiveInfoResponse = userLiveInfo;

export type getAllLiveListResponse = userLiveInfo[];

export type getLiveDataRequest = { readonly days: number };

export type liveStat = {
  readonly duration: number; 
  readonly maxPopularityValue: number; 
  readonly watchCount: number; 
  readonly diamondCount: number; 
  readonly commentCount: number; 
  readonly bananaCount: number
};

export type liveDetail = {
  readonly liveStartTime: number; 
  readonly liveEndTime: number; 
  readonly liveStat: liveStat
};

export type dailyData = {
  readonly date: string; 
  readonly liveTimes: number; 
  readonly liveStat: liveStat
};

export type getLiveDataResponse = {
  readonly beginDate: string; 
  readonly endDate: string; 
  readonly overview: liveStat; 
  readonly liveDetail: {[id: string]: liveDetail}; 
  readonly dailyData?: dailyData[]
};

export type getGiftListRequest = liveID;

export type getGiftListResponse = giftDetail[];

export type getUserInfoRequest = userID;

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

export type getLiveCutInfoRequest = { readonly liverUID: number; readonly liveID: string };

export type getLiveCutInfoResponse = {
  readonly status: boolean; 
  readonly url: string; 
  readonly redirectURL: string
};

export type manager = {
  readonly userInfo: userInfo; 
  readonly customData: string; 
  readonly online: boolean
};

export type getManagerListResponse = manager[];

export type managerUID = { readonly managerUID: number };

export type addManagerRequest = managerUID;

export type deleteManagerRequest = managerUID;

export type getAllKickHistoryRequest = liveID;

export type kickHistory = {
  readonly userID: number; 
  readonly nickname: string; 
  readonly kickTime: number
};

export type getAllKickHistoryResponse = kickHistory[];

export type kickUser = { readonly liveID: string; readonly kickedUID: number };

export type managerKickRequest = kickUser;

export type authorKickRequest = kickUser;

export type getMedalDetailRequest = liverUID;

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

export type getMedalDetailResponse = {
  readonly medal: medal; 
  readonly medalDegree: medalDegree; 
  readonly userRank: string
};

export type getMedalListResponse = (undefined | medal[]);

export type getMedalRankListRequest = liverUID;

export type userMedalInfo = {
  readonly profile: userProfile; 
  readonly friendshipDegree: number; 
  readonly level: number
};

export type getMedalRankListResponse = {
  readonly hasFansClub: boolean; 
  readonly rankList?: userMedalInfo[]; 
  readonly clubName: string; 
  readonly medalCount: number; 
  readonly hasMedal: boolean; 
  readonly userFriendshipDegree: number; 
  readonly userRank: string
};

export type getUserMedalRequest = userID;

export type getUserMedalResponse = medal;

export type wearMedalRequest = liverUID;

export type checkLiveAuthResponse = { readonly liveAuth: boolean };

export type getLiveTypeListResponse = liveType;

export type getPushConfigResponse = {
  readonly streamName: string; 
  readonly streamPullAddress: string; 
  readonly streamPushAddress?: string[]; 
  readonly panoramic: boolean; 
  readonly interval: number; 
  readonly rtmpServer: string; 
  readonly streamKey: string
};

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

export type getTranscodeInfoRequest = { readonly streamName: string };

export type transcodeInfo = {
  readonly streamURL: streamURL; 
  readonly resolution: string; 
  readonly frameRate: number; 
  readonly template: string
};

export type getTranscodeInfoResponse = transcodeInfo[];

export type startLiveRequest = {
  readonly title: string; 
  readonly coverFile: string; 
  readonly streamName: string; 
  readonly portrait: boolean; 
  readonly panoramic: boolean; 
  readonly categoryID: number; 
  readonly subCategoryID: number
};

export type startLiveResponse = liveID;

export type stopLiveRequest = liveID;

export type stopLiveResponse = { readonly duration: number; readonly endReason: string };

export type changeTitleAndCoverRequest = {
  readonly title: string; 
  readonly coverFile: string; 
  readonly liveID: string
};

export type canCutLive = { readonly canCut: boolean };

export type getLiveCutStatusResponse = canCutLive;

export type setLiveCutStatusRequest = canCutLive;

export type danmuInfo = { readonly sendTime: number; readonly userInfo: userInfo };

export type comment = { readonly danmuInfo: danmuInfo; readonly content: string };

export type like = danmuInfo;

export type enterRoom = danmuInfo;

export type followAuthor = danmuInfo;

export type throwBanana = { readonly danmuInfo: danmuInfo; readonly bananaCount: number };

export type drawPoint = {
  readonly marginLeft: number; 
  readonly marginTop: number; 
  readonly scaleRatio: number; 
  readonly handup: boolean; 
  readonly pointWidth: number; 
  readonly pointHeight: number
};

export type drawGiftInfo = {
  readonly screenWidth: number; 
  readonly screenHeight: number; 
  readonly drawPoint?: drawPoint[]
};

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

export type richTextUserInfo = { readonly userInfo: userInfo; readonly color: string };

export type richTextPlain = { readonly text: string; readonly color: string };

export type richTextImage = {
  readonly pictures: string[]; 
  readonly alternativeText: string; 
  readonly alternativeColor: string
};

export type richTextSegment = 
    { type: "UserInfo"; readonly segment: richTextUserInfo }
  | { type: "Plain"; readonly segment: richTextPlain }
  | { type: "Image"; readonly segment: richTextImage };

export type richText = { readonly sendTime: number; readonly segments: richTextSegment[] };

export type joinClub = {
  readonly joinTime: number; 
  readonly fansInfo: userInfo; 
  readonly uperInfo: userInfo
};

export type sharePlatformType = 
    "QQ"
  | "Qzone"
  | "Weibo"
  | "WeChat"
  | "WeChatMoments"
  | "AcFunMoment"
  | { TAG: "UnknownPlatform"; _0: number };

export type shareLive = {
  readonly danmuInfo: danmuInfo; 
  readonly sharePlatform: sharePlatformType; 
  readonly sharePlatformIcon: string
};

export type bananaCount = { readonly bananaCount: string };

export type displayInfo = {
  readonly watchingCount: string; 
  readonly likeCount: string; 
  readonly likeDelta: number
};

export type topUsers = watchingUser[];

export type recentComments = comment[];

export type redpackDisplayStatus = 
    "RedpackShow"
  | "RedpackGetToken"
  | "RedpackGrab"
  | { TAG: "UnknownRedpackDisplayStatus"; _0: number };

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

export type redpackList = redpack[];

export type chatCall = {
  readonly chatID: string; 
  readonly liveID: string; 
  readonly callTime: number
};

export type chatMediaType = 
    "Audio"
  | "Video"
  | { TAG: "UnknownChatMediaType"; _0: number };

export type chatAccept = {
  readonly chatID: string; 
  readonly mediaType: chatMediaType; 
  readonly signalInfo: string
};

export type chatReady = {
  readonly chatID: string; 
  readonly guest: userInfo; 
  readonly mediaType: chatMediaType
};

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

export type chatEnd = { readonly chatID: string; readonly endType: chatEndType };

export type danmakuStopError = { readonly error: string };

export type kickedOut = { readonly kickedOutReason: string };

export type violationAlert = { readonly violationContent: string };

export type managerStateType = 
    "NotManager"
  | "ManagerAdded"
  | "ManagerRemoved"
  | "IsManager"
  | { TAG: "UnknownManagerStateType"; _0: number };

export type managerState = { readonly managerState: managerStateType };
