import { Session } from './src/AcLive__Session'
import { config } from './src/AcLive__Session.gen'

export const WebAPISession: (config?: config) => Session

export const NodeSession: (config?: config) => Session

export const TauriSession: (config?: config) => Session
