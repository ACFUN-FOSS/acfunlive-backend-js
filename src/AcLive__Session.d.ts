import type { websocketError, jsonError } from './AcLive__Session.gen.ts'
import type { addManagerRequest, authorKickRequest, bananaCount, changeTitleAndCoverRequest, chatAccept, chatCall, chatEnd, chatReady, checkLiveAuthResponse, comment, danmaku, danmakuStopError, deleteManagerRequest, displayInfo, emptyDanmaku, emptyMessage, enterRoom, error, followAuthor, getAllGiftListResponse, getAllKickHistoryRequest, getAllKickHistoryResponse, getAllLiveListResponse, getBillboardRequest, getBillboardResponse, getDanmakuRequest, getDanmakuResponse, getGiftListRequest, getGiftListResponse, getLiveCutInfoRequest, getLiveCutInfoResponse, getLiveCutStatusResponse, getLiveDataRequest, getLiveDataResponse, getLiveStatusResponse, getLiveTypeListResponse, getLuckListRequest, getLuckListResponse, getManagerListResponse, getMedalDetailRequest, getMedalDetailResponse, getMedalListResponse, getMedalRankListRequest, getMedalRankListResponse, getPlaybackRequest, getPlaybackResponse, getPushConfigResponse, getSummaryRequest, getSummaryResponse, getTranscodeInfoRequest, getTranscodeInfoResponse, getUserInfoRequest, getUserInfoResponse, getUserLiveInfoRequest, getUserLiveInfoResponse, getUserMedalRequest, getUserMedalResponse, getWalletBalanceResponse, getWatchingListRequest, getWatchingListResponse, gift, joinClub, kickedOut, like, loginRequest, loginResponse, managerKickRequest, managerState, message, optionalMessage, receiveForwardResponse, recentComments, redpackList, requestForwardRequest, richText, setClientIDRequest, setLiveCutStatusRequest, setTokenRequest, shareLive, startLiveRequest, startLiveResponse, stopDanmakuRequest, stopLiveRequest, stopLiveResponse, throwBanana, topUsers, violationAlert, wearMedalRequest } from './data/AcLive__Message.gen.ts'

export type event = {
    'websocketOpen': [undefined, undefined];
    'websocketClose': [undefined, undefined];
    'websocketError': [websocketError, undefined];
    'jsonError': [jsonError, undefined];
    'heartbeat': [undefined, undefined];
    'login': [message<loginResponse>, string];
    'setClientID': [emptyMessage, string];
    'requestForward': [emptyMessage, string];
    'receiveForward': [message<receiveForwardResponse>, string];
    'setToken': [emptyMessage, string];
    'getDanmaku': [optionalMessage<getDanmakuResponse>, string];
    'stopDanmaku': [emptyMessage, string];
    'getWatchingList': [message<getWatchingListResponse>, string];
    'getBillboard': [message<getBillboardResponse>, string];
    'getSummary': [message<getSummaryResponse>, string];
    'getLuckList': [message<getLuckListResponse>, string];
    'getPlayback': [message<getPlaybackResponse>, string];
    'getAllGiftList': [message<getAllGiftListResponse>, string];
    'getWalletBalance': [message<getWalletBalanceResponse>, string];
    'getUserLiveInfo': [message<getUserLiveInfoResponse>, string];
    'getAllLiveList': [message<getAllLiveListResponse>, string];
    'getLiveData': [message<getLiveDataResponse>, string];
    'getGiftList': [message<getGiftListResponse>, string];
    'getUserInfo': [message<getUserInfoResponse>, string];
    'getLiveCutInfo': [message<getLiveCutInfoResponse>, string];
    'getManagerList': [message<getManagerListResponse>, string];
    'addManager': [emptyMessage, string];
    'deleteManager': [emptyMessage, string];
    'getAllKickHistory': [message<getAllKickHistoryResponse>, string];
    'managerKick': [emptyMessage, string];
    'authorKick': [emptyMessage, string];
    'getMedalDetail': [message<getMedalDetailResponse>, string];
    'getMedalList': [message<getMedalListResponse>, string];
    'getMedalRankList': [message<getMedalRankListResponse>, string];
    'getUserMedal': [message<getUserMedalResponse>, string];
    'wearMedal': [emptyMessage, string];
    'cancelWearMedal': [emptyMessage, string];
    'checkLiveAuth': [message<checkLiveAuthResponse>, string];
    'getLiveTypeList': [message<getLiveTypeListResponse>, string];
    'getPushConfig': [message<getPushConfigResponse>, string];
    'getLiveStatus': [message<getLiveStatusResponse>, string];
    'getTranscodeInfo': [message<getTranscodeInfoResponse>, string];
    'startLive': [message<startLiveResponse>, string];
    'stopLive': [message<stopLiveResponse>, string];
    'changeTitleAndCover': [emptyMessage, string];
    'getLiveCutStatus': [message<getLiveCutStatusResponse>, string];
    'setLiveCutStatus': [emptyMessage, string];
    'comment': [danmaku<comment>, number];
    'like': [danmaku<like>, number];
    'enterRoom': [danmaku<enterRoom>, number];
    'followAuthor': [danmaku<followAuthor>, number];
    'throwBanana': [danmaku<throwBanana>, number];
    'gift': [danmaku<gift>, number];
    'richText': [danmaku<richText>, number];
    'joinClub': [danmaku<joinClub>, number];
    'shareLive': [danmaku<shareLive>, number];
    'danmakuStop': [emptyDanmaku, number];
    'bananaCount': [danmaku<bananaCount>, number];
    'displayInfo': [danmaku<displayInfo>, number];
    'topUsers': [danmaku<topUsers>, number];
    'recentComments': [danmaku<recentComments>, number];
    'redpackList': [danmaku<redpackList>, number];
    'chatCall': [danmaku<chatCall>, number];
    'chatAccept': [danmaku<chatAccept>, number];
    'chatReady': [danmaku<chatReady>, number];
    'chatEnd': [danmaku<chatEnd>, number];
    'danmakuStopError': [danmaku<danmakuStopError>, number];
    'kickedOut': [danmaku<kickedOut>, number];
    'violationAlert': [danmaku<violationAlert>, number];
    'managerState': [danmaku<managerState>, number];
};

export type request = {
    'login': [loginRequest, message<loginResponse>];
    'setClientID': [setClientIDRequest, emptyMessage];
    'requestForward': [requestForwardRequest, emptyMessage];
    'setToken': [setTokenRequest, emptyMessage];
    'getDanmaku': [getDanmakuRequest, optionalMessage<getDanmakuResponse>];
    'stopDanmaku': [stopDanmakuRequest, emptyMessage];
    'getWatchingList': [getWatchingListRequest, message<getWatchingListResponse>];
    'getBillboard': [getBillboardRequest, message<getBillboardResponse>];
    'getSummary': [getSummaryRequest, message<getSummaryResponse>];
    'getLuckList': [getLuckListRequest, message<getLuckListResponse>];
    'getPlayback': [getPlaybackRequest, message<getPlaybackResponse>];
    'getAllGiftList': [undefined, message<getAllGiftListResponse>];
    'getWalletBalance': [undefined, message<getWalletBalanceResponse>];
    'getUserLiveInfo': [getUserLiveInfoRequest, message<getUserLiveInfoResponse>];
    'getAllLiveList': [undefined, message<getAllLiveListResponse>];
    'getLiveData': [getLiveDataRequest, message<getLiveDataResponse>];
    'getGiftList': [getGiftListRequest, message<getGiftListResponse>];
    'getUserInfo': [getUserInfoRequest, message<getUserInfoResponse>];
    'getLiveCutInfo': [getLiveCutInfoRequest, message<getLiveCutInfoResponse>];
    'getManagerList': [undefined, message<getManagerListResponse>];
    'addManager': [addManagerRequest, emptyMessage];
    'deleteManager': [deleteManagerRequest, emptyMessage];
    'getAllKickHistory': [getAllKickHistoryRequest, message<getAllKickHistoryResponse>];
    'managerKick': [managerKickRequest, emptyMessage];
    'authorKick': [authorKickRequest, emptyMessage];
    'getMedalDetail': [getMedalDetailRequest, message<getMedalDetailResponse>];
    'getMedalList': [undefined, message<getMedalListResponse>];
    'getMedalRankList': [getMedalRankListRequest, message<getMedalRankListResponse>];
    'getUserMedal': [getUserMedalRequest, message<getUserMedalResponse>];
    'wearMedal': [wearMedalRequest, emptyMessage];
    'cancelWearMedal': [undefined, emptyMessage];
    'checkLiveAuth': [undefined, message<checkLiveAuthResponse>];
    'getLiveTypeList': [undefined, message<getLiveTypeListResponse>];
    'getPushConfig': [undefined, message<getPushConfigResponse>];
    'getLiveStatus': [undefined, message<getLiveStatusResponse>];
    'getTranscodeInfo': [getTranscodeInfoRequest, message<getTranscodeInfoResponse>];
    'startLive': [startLiveRequest, message<startLiveResponse>];
    'stopLive': [stopLiveRequest, message<stopLiveResponse>];
    'changeTitleAndCover': [changeTitleAndCoverRequest, emptyMessage];
    'getLiveCutStatus': [undefined, message<getLiveCutStatusResponse>];
    'setLiveCutStatus': [setLiveCutStatusRequest, emptyMessage];
};

export type unsubscribe = () => void;

export interface Session {
    connect(): void;

    disConnect(): void;

    isConnecting(): boolean;

    on<K extends keyof event>(event: K, onData: (data: event[K][0]) => void, key?: event[K][1], onError?: (error: error) => void): unsubscribe;

    request<K extends keyof request>(request: K, data: request[K][0], requestID?: string): void;

    asyncRequest<K extends keyof request>(request: K, data: request[K][0], requestIDPrefix?: string, timeout?: number): Promise<request[K][1]>;
}
