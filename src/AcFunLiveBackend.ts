import { makeWebAPISession, makeNodeSession, makeTauriSession } from './AcFunLiveBackend.bs.mjs'
import { Session } from './AcLive__Session'
import { config } from './AcLive__Session.gen'

export const WebAPISession: (config: config | undefined) => Session = makeWebAPISession

export const NodeSession: (config: config | undefined) => Session = makeNodeSession

export const TauriSession: (config: config | undefined) => Session = makeTauriSession
