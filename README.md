# 双视频同步播放器

一个本地运行的双视频同步播放器，支持左右视频加载、同步播放、字幕导入、布局切换、书签和画中画拖拽。

## 本地运行

**前置条件：** Node.js

1. 安装依赖：
   ```bash
   npm install
   ```
2. 类型检查：
   ```bash
   npm run check
   ```
3. 运行测试：
   ```bash
   npm test
   ```
4. 构建生产文件：
   ```bash
   npm run build
   ```
5. 本地预览：
   ```bash
   npm run preview -- --host 127.0.0.1 --port 5173 --open
   ```

也可以直接双击 `启动播放器.bat`，脚本会自动构建并启动预览服务。

## 说明

- 当前应用不需要后端服务或 API key。
- 样式通过本地 Tailwind 构建生成，不依赖外部 CDN。
- 项目位于中文路径时，Vite 开发服务器的依赖预构建可能受 esbuild 路径编码影响；生产构建和预览模式已规避该问题。
