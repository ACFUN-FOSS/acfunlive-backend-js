import { nodeResolve } from '@rollup/plugin-node-resolve';

export default [
    {
        input: './src/platform/WebAPI.js',
        output: {
            file: './webapi.js'
        },
        external: [
            'tauri-plugin-websocket-api',
            'uuid',
            'ws'
        ],
        plugins: [nodeResolve()]
    },
    {
        input: './src/platform/Node.js',
        output: {
            file: './node.js'
        },
        external: [
            'tauri-plugin-websocket-api',
            'uuid',
            'ws'
        ],
        plugins: [nodeResolve()]
    },
    {
        input: './src/platform/Tauri.js',
        output: {
            file: './tauri.js'
        },
        external: [
            'tauri-plugin-websocket-api',
            'uuid',
            'ws'
        ],
        plugins: [nodeResolve()]
    }
]
