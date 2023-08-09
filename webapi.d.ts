import { Session } from './src/AcLive__Session';
import { config } from './src/AcLive__Session.gen';

export * from './src/AcLive__Session';
export * from './src/AcLive__Session.gen';
export * from './src/data/AcLive__Message.gen';

declare const webApiSession: (config?: config) => Session;
export default webApiSession
