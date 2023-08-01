import type { websocketError, jsonError } from './AcLive__Session.gen'
import type { error, loginRequest, loginResponse, message } from './data/AcLive__Message.gen'

export type event = {
    "websocketOpen": [undefined, undefined];
    "websocketClose": [undefined, undefined];
    "websocketError": [websocketError, undefined];
    "jsonError": [jsonError, undefined];
    "heartbeat": [undefined, undefined];
    "login": [message<loginResponse>, string];
};

export type request = {
    "login": [loginRequest, message<loginResponse>];
};

export interface Session {
    connect(): void;

    disConnect(): void;

    isConnecting(): boolean;

    on<K extends keyof event>(event: K, key: event[K][1] | undefined, onData: (data: event[K][0]) => void, onError: (error: error) => void | undefined): () => void;

    request<K extends keyof request>(request: K, data: request[K][0], requestID: string | undefined): void;

    oneshot<K extends keyof request>(request: K, data: request[K][0], requestIDPrefix: string | undefined, timeout: number | undefined): Promise<request[K][1]>;
};
