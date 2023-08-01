import { makeWebAPISession, makeNodeSession, makeTauriSession } from './AcFunLiveBackend.bs.mjs'
import { Session } from './Session'
import { config } from './Session.gen'

export const WebAPISession: (config: config | undefined) => Session = makeWebAPISession

export const NodeSession: (config: config | undefined) => Session = makeNodeSession

export const TauriSession: (config: config | undefined) => Session = makeTauriSession
