import { makeWebAPISession, makeNodeSession, makeTauriSession } from './src/AcFunLiveBackend.bs.mjs';

export const WebAPISession = makeWebAPISession;

export const NodeSession = makeNodeSession;

export const TauriSession = makeTauriSession;
