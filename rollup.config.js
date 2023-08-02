import { nodeResolve } from '@rollup/plugin-node-resolve';

export default [
    {
        input: 'src/platform/WebAPI.js',
        output: {
            file: 'webapi.js'
        },
        external: ['uuid'],
        plugins: [nodeResolve()]
    },
    {
        input: 'src/platform/Node.js',
        output: {
            file: 'node.js'
        },
        external: [
            'uuid',
            'ws'
        ],
        plugins: [nodeResolve()]
    },
    {
        input: 'src/platform/Tauri.js',
        output: {
            file: 'tauri.js'
        },
        external: [
            'tauri-plugin-websocket-api',
            'uuid'
        ],
        plugins: [nodeResolve()]
    }
]
