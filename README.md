[README.md](https://github.com/user-attachments/files/29040539/README.md)
# GameGuardian HTTP API

让外部程序通过 HTTP API 直接调用 GameGuardian 内存搜索/修改等功能，支持传入完整 Lua 脚本。


悠然制作


## 快速开始

### 安装

```bash
adb install GG_v15.apk
```

### 调用

```bash
# JSON 模式（简单脚本）
curl -X POST http://localhost:8080/api/gg/runScript -d '{"script":"return 123"}'

# 原始文本模式（支持引号、联合搜索等复杂脚本）
curl -X POST http://localhost:8080/api/gg/runScript -H "Content-Type: text/plain" \
  -d 'gg.searchNumber("100",gg.TYPE_DWORD);return gg.getResultsCount()'
```

---

## API 端点

| 端点                     | 方法   | 说明                                                        |
| ---------------------- | ---- | --------------------------------------------------------- |
| `/api/status`          | GET  | 服务状态                                                      |
| `/api/test`            | GET  | 连接测试                                                      |
| `/api/gg/info`         | GET  | 目标进程信息（PID、包名）                                            |
| `/api/gg/status`       | GET  | 搜索结果数量                                                    |
| `/api/gg/searchNumber` | POST | 搜索数值 `{"value":"100","type":1}`（实验api，不稳定，请正式使用runScript） |
| `/api/gg/getResults`   | POST | 获取搜索结果（最多100条）（实验api，不稳定，请正式使用runScript）                  |
| `/api/gg/editAll`      | POST | 批量修改 `{"value":"999"}`（实验api，不稳定，请正式使用runScript）          |
| `/api/gg/runScript`    | POST | **执行任意 GG Lua 脚本（请主要使用这个）**                               |

### `/api/gg/runScript` — 核心端点

**两种调用模式：**

```bash
# 模式1：JSON 包装（适合简单脚本，内容不含双引号）
curl -X POST http://localhost:8080/api/gg/runScript \
  -d '{"script":"return 100+2"}'

# 响应：{"success":true,"result":"102"}
```

```bash
# 模式2：原始文本（适合任意脚本，支持引号、联合搜索等）
curl -X POST http://localhost:8080/api/gg/runScript \
  -H "Content-Type: text/plain" \
  -d 'gg.clearResults()
gg.searchNumber("100",gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(gg.getResultsCount())
gg.editAll("999",gg.TYPE_DWORD)
gg.toast("done")
return "ok"'

# 响应：{"success":true,"result":"ok"}
```

建议使用 **模式二**

**判断逻辑**：body 以 `{"` 开头走 JSON 解析，否则作为原始脚本。

---

## 完整工作流示例

### 搜索 → 获取 → 修改 → 验证 → 还原

```bash
# 1. 搜索
curl -s -X POST http://localhost:8080/api/gg/runScript \
  -H "Content-Type: text/plain" \
  -d 'gg.clearResults();gg.searchNumber("100",gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0,-1);return gg.getResultsCount()'
# → {"success":true,"result":"926"}

# 2. 获取前3条结果
curl -s -X POST http://localhost:8080/api/gg/runScript \
  -H "Content-Type: text/plain" \
  -d 'gg.clearResults();gg.searchNumber("100",gg.TYPE_DWORD);local r=gg.getResults(3);local s="";for i=1,#r do s=s.."0x"..string.format("%X",r[i].address).."="..r[i].value.."; " end;return s'
# → {"success":true,"result":"0x12C49050=100; 0x12C4C990=100; 0x12C50208=100; "}

# 3. 批量修改
curl -s -X POST http://localhost:8080/api/gg/runScript \
  -H "Content-Type: text/plain" \
  -d 'gg.clearResults();gg.searchNumber("100",gg.TYPE_DWORD);gg.getResults(gg.getResultsCount());gg.editAll("999",gg.TYPE_DWORD);gg.toast("modified");return "ok"'
# → {"success":true,"result":"ok"}

# 4. 验证（搜索新值）
curl -s -X POST http://localhost:8080/api/gg/runScript \
  -H "Content-Type: text/plain" \
  -d 'gg.clearResults();gg.searchNumber("999",gg.TYPE_DWORD);return gg.getResultsCount()'
# → {"success":true,"result":"926"}

# 5. 还原
curl -s -X POST http://localhost:8080/api/gg/runScript \
  -H "Content-Type: text/plain" \
  -d 'gg.clearResults();gg.searchNumber("999",gg.TYPE_DWORD);gg.getResults(gg.getResultsCount());gg.editAll("100",gg.TYPE_DWORD);return "restored"'
# → {"success":true,"result":"restored"}
```

---

## 客户端代码

### Python

```python
import requests

API = "http://localhost:8080/api/gg/runScript"

def run_script(script: str) -> dict:
    """执行 GG Lua 脚本，自动选择 JSON 或 raw 模式"""
    if '"' in script:
        # 含引号 → 原始文本模式
        resp = requests.post(API, data=script.encode(),
                             headers={"Content-Type": "text/plain"})
    else:
        # 简单脚本 → JSON 模式
        resp = requests.post(API, json={"script": script})
    return resp.json()


# 搜索并修改
result = run_script("""
gg.clearResults()
gg.searchNumber("100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
local count = gg.getResultsCount()
gg.getResults(count)
gg.editAll("999", gg.TYPE_DWORD)
gg.toast("modified " .. count .. " values")
return count
""")
print(result)  # {"success": True, "result": "926"}


# 简单计算
result = run_script("return 100+2")
print(result)  # {"success": True, "result": "102"}
```

### JavaScript / Node.js

```javascript
const API = "http://localhost:8080/api/gg/runScript";

async function runScript(script) {
    const hasQuotes = script.includes('"');
    const options = {
        method: "POST",
        body: hasQuotes ? script : JSON.stringify({ script }),
        headers: hasQuotes
            ? { "Content-Type": "text/plain" }
            : { "Content-Type": "application/json" },
    };
    const resp = await fetch(API, options);
    return resp.json();
}

// 使用
const result = await runScript(
    'gg.clearResults();gg.searchNumber("100",gg.TYPE_DWORD);return gg.getResultsCount()'
);
console.log(result); // { success: true, result: "926" }
```

---

## 可用的 GG API

脚本中可直接使用 **所有** 标准 GameGuardian Lua API：

### 搜索

```lua
gg.searchNumber("100", gg.TYPE_DWORD)                          -- 简单搜索
gg.searchNumber("100;200:500", gg.TYPE_DWORD)                  -- 联合搜索（范围+值）
gg.searchNumber("100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1) -- 完整参数
gg.refineNumber("100", gg.TYPE_DWORD)                          -- 精确搜索
gg.clearResults()                                               -- 清空结果
gg.getResultsCount()                                            -- 结果数量
```

### 获取与修改

```lua
local results = gg.getResults(10)        -- 获取前10条
for i, v in ipairs(results) do
    print(v.address, v.value)            -- 地址和值
    v.value = "999"                      -- 修改单条
end
gg.setValues(results)                    -- 批量写入

gg.editAll("999", gg.TYPE_DWORD)         -- 全量修改（需先 getResults）
```

### UI

```lua
gg.toast("提示文字")                      -- Toast 提示
gg.alert("弹窗内容")                       -- 弹窗（阻塞，需手动关闭弹窗）
```

### 自定义搜索流

```lua
gg.clearResults()
gg.searchNumber("100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)

local count = gg.getResultsCount()
if count > 100 then
    gg.refineNumber("100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    count = gg.getResultsCount()
end

if count > 0 then
    gg.getResults(count)
    gg.editAll("999", gg.TYPE_DWORD)
    gg.toast("Modified " .. count .. " values")
else
    gg.toast("No results found")
end
```

---

## 构建

```bash
cd GameGuardian
apktool b -f -o dist/output.apk .
jarsigner -keystore debug.keystore -storepass android -keypass android \
  dist/output.apk androiddebugkey
adb install -r dist/output.apk
```

---

## 与原版 GG 的完整差异

> **原版**：`GameGuardian.apk`（未修改的原始 GG）  
> **修改版**：`GG_v15.apk`  
> **对比方式**：`apktool d` 反编译后 `diff -r` 逐文件比较

### 改动总览

| #   | 文件                         | 改动       | 说明                               |
| --- | -------------------------- | -------- | -------------------------------- |
| 1   | `AndroidManifest.xml`      | +1 行     | 注册 `HttpApiService`              |
| 2   | `HttpApiService.smali`     | **新增文件** | HTTP 服务器 + 全部 API                |
| 3   | `HttpApiService$1.smali`   | **新增文件** | 服务端 accept 循环线程                  |
| 4   | `HttpApiService$1$1.smali` | **新增文件** | 单客户端处理线程                         |
| 5   | `ae.smali`                 | +45 行    | 新增 `startHttpApiService()` 方法及调用 |
| 6   | `MainService.smali`        | 3 处修饰符   | `aj` `am` `d` 改 public           |
| 7   | `Script.smali`             | 1 处修饰符   | `a` 改 public                     |

**总计**：新增 3 个文件，修改 4 个文件。

---

### 逐文件 diff

#### 1. AndroidManifest.xml

```diff
+ <service android:exported="false" android:name="HttpApiService"/>
```

GG 启动时由 `ae` 调用 `startService` 拉起 HTTP 服务。

#### 2. ae.smali — 启动入口

`ae` 是 GG 的初始化类（`Landroid/ext/ae;`）。新增方法和一行调用：

```java
// 新增方法（+42 行）
private void startHttpApiService() {
    try {
        Intent intent = new Intent(this, HttpApiService.class);
        startService(intent);
        Log.i("GameGuardian", "HTTP API Service started");
    } catch (Exception e) {
        Log.e("GameGuardian", "Failed to start HTTP API Service", e);
    }
}
```

```diff
// 在 ae 初始化流程末尾新增 1 行调用
+ invoke-direct {p0}, Landroid/ext/ae;->startHttpApiService()V
```

#### 3. HttpApiService.smali（新增 ~500 行）— HTTP 服务核心

| 方法                               | 说明                                                                     |
| -------------------------------- | ---------------------------------------------------------------------- |
| `onCreate()` / `onDestroy()`     | 生命周期：启动/停止服务器                                                          |
| `startServer()` / `stopServer()` | ServerSocket(8080) 管理                                                  |
| `handleClient()`                 | 解析 HTTP 请求，读取 Content-Length，分发                                        |
| `handleRequest()`                | 路由：`/api/status` → `/api/test` → `/api/gg/*`                           |
| `handleGGCommand()`              | GG 子路由：info / status / searchNumber / getResults / editAll / runScript |
| `handleInfo()`                   | 读 `MainService.ap` 返回进程信息                                              |
| `handleStatus()`                 | 读 `MainService.aj` 返回结果计数                                              |
| `handleSearchNumber()`           | 调 `ra.a()` native 方法搜索内存                                               |
| `handleGetResults()`             | 遍历 `MainService.am` 返回前 100 条                                          |
| `handleEditAll()`                | 遍历 `am` 批量修改                                                           |
| `handleRunScript()`              | **执行任意 GG Lua 脚本**（核心）                                                 |
| `extractJsonValue()`             | 简易 JSON key-value 提取器                                                  |
| `sendResponse()`                 | HTTP 200 + JSON 响应                                                     |

**POST body 读取**（区别于常见的 `readLine` 方式）：

```java
// 解析 Content-Length 头
// 循环 read(char[cl]) 读取精确字节数
// 避免 readLine() 在无换行符时永久阻塞
```

**handleRunScript 核心逻辑**：

```java
// 1. 判断调用模式
if (body.startsWith("{\""))
    script = extractJsonValue(body, "script");  // JSON 模式
else
    script = body;                               // 原始文本模式

// 2. 获取或自动创建 Lua 环境
if (MainService.instance.d != null && MainService.instance.d.a != null)
    globals = MainService.instance.d.a;          // 已有 Script
else {
    Script s = new Script("", 0, "");            // 自动创建（含全部 GG API）
    MainService.instance.d = s;
    globals = s.a;
}

// 3. 编译 + 执行
LuaValue compiled = globals.a(
    new ByteArrayInputStream(script.getBytes("UTF-8")),
    "script", "t", globals                       // 第4参数传 Globals 自身作环境
);
Varargs result = compiled.Y();                   // Y() = LuaJ 混淆后的 call()
LuaValue ret = result.g();                       // g() = 取第一个返回值
return "{\"success\":true,\"result\":\"" + ret.d_() + "\"}";
//                                         d_() = 混淆后的 toString()
```

> **注意**：GG 使用的 LuaJ 引擎经过混淆，`call()` → `Y()`，`toString()` → `d_()`，常量的 `LuaValue.NONE` 不存在。

#### 4. MainService.smali — 3 个字段改 public

```diff
- .field volatile aj:J
+ .field public volatile aj:J

- .field final am:Landroid/c/a;
+ .field public final am:Landroid/c/a;

- .field d:Landroid/ext/Script;
+ .field public d:Landroid/ext/Script;
```

| 字段   | 类型                     | 读取者                             | 用途                             |
| ---- | ---------------------- | ------------------------------- | ------------------------------ |
| `aj` | `long`                 | handleStatus                    | 搜索结果计数                         |
| `am` | `Landroid/c/a;`        | handleGetResults, handleEditAll | 搜索结果列表                         |
| `d`  | `Landroid/ext/Script;` | handleRunScript                 | 脚本引擎（**含写入**：首次调用时自动创建 Script） |

#### 5. Script.smali — 1 个字段改 public

```diff
- .field final a:Lluaj/Globals;
+ .field public final a:Lluaj/Globals;
```

`Script.a` 是 LuaJ 全局环境，handleRunScript 通过它编译执行脚本。

> **为什么必须改 public**：Android API ≥26 强制跨包字段访问检查。`HttpApiService` 在包 `catch_.me_.if_.you_.can_`，`MainService`/`Script` 在包 `android.ext`，package-private 字段会触发 `IllegalAccessError`。

---

### 请求流向

```
外部程序 (Python/JS/curl)
    │  HTTP POST
    ▼
HttpApiService: handleClient()
    │  readLine() 解析请求行 + Content-Length 读 body
    ▼
handleRequest() → handleGGCommand()
    │
    ├── /api/gg/info       → 读 MainService.ap
    ├── /api/gg/status     → 读 MainService.aj
    ├── /api/gg/searchNumber → 调 ra.a() native
    ├── /api/gg/getResults → 遍历 MainService.am
    ├── /api/gg/editAll    → 写 MainService.am 元素
    └── /api/gg/runScript  → Globals.a() → Y() 执行 Lua
                                  │
                                  ├── Script 存在? → 复用它（完整 GG API 支持）
                                  └── Script 不存在? → new Script("",0,"") 自动创建
```

---

## 响应格式

### 成功

```json
{"success": true, "result": "脚本 return 值"}
```

### 错误

```json
{"error": "错误描述"}
```

常见错误：

- `"GG not initialized"` — GG 服务未启动
- `"No target process selected"` — 未附加到目标进程（搜索/修改需要）
- `"Empty request body"` — POST body 为空
- `"script:N ..."` — Lua 语法错误或运行时错误

---

## 注意事项

1. **必须先附加进程**：使用 `gg.searchNumber` 等内存操作前，需在 GG 界面选择一个目标进程
2. **原始文本模式自动 Fallback**：首次调用时若 `MainService.d` 不存在，会自动创建 Script 对象（含标准 Lua 库和 GG API），无需手动加载脚本
3. **`print()` 输出到 logcat**，不会出现在 HTTP 响应中；返回值用 `return`
4. **`gg.alert()` 是阻塞弹窗**，会等待用户点击后才继续执行
5. **无超时限制**：长时间运行的脚本不会自动终止
6. **editAll 前需 getResults**：GG 要求先获取结果列表才能批量修改
