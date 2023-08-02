[acfunlive-backend](https://github.com/ACFUN-FOSS/acfunlive-backend)的`javascript`和`rescript`接口，支持Web API、Node和Tauri

### Web API（浏览器）

```javascript
import { webApiSession } from 'acfunlive-backend-js/webapi.js'

const session = webApiSession()

session.connect()
session.on("websocketOpen", () => login())
session.on("heartbeat", () => console.log("heartbeat"))

async function login() {
    await session.asyncRequest("login", { account: "", password: "" })
    const liveList = await session.asyncRequest("getAllLiveList");
    const liverUID = liveList.data[0].profile.userID
    session.on("comment", (c) => console.log("comment: ", c.data), liverUID)
    await session.asyncRequest("getDanmaku", { liverUID })
}
```

### Node

需要另外安装依赖[`ws`](https://www.npmjs.com/package/ws)

```javascript
import { nodeSession } from 'acfunlive-backend-js/node.js'

const session = nodeSession()

session.connect()
session.on("websocketOpen", () => login())
session.on("heartbeat", () => console.log("heartbeat"))

async function login() {
    await session.asyncRequest("login", { account: "", password: "" })
    const liveList = await session.asyncRequest("getAllLiveList");
    const liverUID = liveList.data[0].profile.userID
    session.on("comment", (c) => console.log("comment: ", c.data), liverUID)
    await session.asyncRequest("getDanmaku", { liverUID })
}
```

### Tauri

需要另外安装依赖[`tauri-plugin-websocket`](https://github.com/orzogc/tauri-plugin-websocket/tree/ac-live-fix)，注意是要安装`ac-live-fix`分支

```
yarn add https://github.com/orzogc/tauri-plugin-websocket#ac-live-fix
```

```javascript
import { tauriSession } from 'acfunlive-backend-js/tauri.js'

const session = tauriSession()

session.connect()
session.on("websocketOpen", () => login())
session.on("heartbeat", () => console.log("heartbeat"))

async function login() {
    await session.asyncRequest("login", { account: "", password: "" })
    const liveList = await session.asyncRequest("getAllLiveList");
    const liverUID = liveList.data[0].profile.userID
    session.on("comment", (c) => console.log("comment: ", c.data), liverUID)
    await session.asyncRequest("getDanmaku", { liverUID })
}
```
