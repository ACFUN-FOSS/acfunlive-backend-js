import { Session } from './src/AcLive__Session.ts';
import { config } from './src/AcLive__Session.gen.ts';

export * from './src/AcLive__Session.ts';
export * from './src/AcLive__Session.gen.ts';
export * from './src/data/AcLive__Message.gen.ts';

declare const webApiSession: (config?: config) => Session;
export default webApiSession
