import type { config, Session } from './types.d.ts';

export type * from './types.d.ts';

declare const webApiSession: (config?: config) => Session;
export default webApiSession
