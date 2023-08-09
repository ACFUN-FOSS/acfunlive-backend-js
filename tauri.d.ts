import { Session } from './src/AcLive__Session';
import { config } from './src/AcLive__Session.gen';

export { Session } from './src/AcLive__Session';
export { config } from './src/AcLive__Session.gen';
export * from './src/data/AcLive__Message.gen';

declare const tauriSession: (config?: config) => Session;
export default tauriSession;
