import { Session } from './src/AcLive__Session.ts';
import { config } from './src/AcLive__Session.gen.ts';

export * from './src/AcLive__Session.ts';
export * from './src/AcLive__Session.gen.ts';
export * from './src/data/AcLive__Message.gen.ts';

declare const nodeSession: (config?: config) => Session;
export default nodeSession;
