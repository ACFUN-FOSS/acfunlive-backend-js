/* TypeScript file generated from AcLive__Session.resi by genType. */
/* eslint-disable import/first */


import type {Exn_t as Js_Exn_t} from '../src/shims/Js.shim';

import type {S_Error_t as RescriptStruct_S_Error_t} from 'rescript-struct/RescriptStruct.gen';

// tslint:disable-next-line:interface-over-type-literal
export type websocketError = { readonly error?: Js_Exn_t; readonly message?: string };

// tslint:disable-next-line:interface-over-type-literal
export type jsonError = { readonly json?: string; readonly error: RescriptStruct_S_Error_t };

// tslint:disable-next-line:interface-over-type-literal
export type config = {
  readonly websocketUrl: string; 
  readonly autoReconnect: boolean; 
  readonly oneshotTimeout: number
};
