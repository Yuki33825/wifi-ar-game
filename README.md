# 脱走したWi-Fiを追いかけろ！

AR（拡張現実）を使ったWi-Fi情報共有ゲームです。スマートフォンで会議室のWi-Fi情報を「捕まえる」体験を提供します。

## 🚀 デプロイ方法

### 方法1: Vercel CLIを使用（推奨）

1. **Vercel CLIをインストール**（未インストールの場合）
   ```bash
   npm install -g vercel
   ```

2. **Vercelにログイン**
   ```bash
   vercel login
   ```

3. **プロジェクトディレクトリに移動**
   ```bash
   cd "/Users/yukihirosugawara/DENTSU Internship/中間課題/中間課題v0"
   ```

4. **デプロイ実行**
   ```bash
   vercel --prod
   ```

   初回デプロイ時は、いくつか質問されます：
   - Set up and deploy? → **Y**
   - Which scope? → あなたのアカウントを選択
   - Link to existing project? → **N**（新規プロジェクトの場合）
   - Project name? → プロジェクト名を入力（例: `wifi-ar-game`）
   - Directory? → **./** またはそのままEnter

5. **デプロイ完了後、URLが表示されます**
   ```
   🔗  Production: https://your-project-name.vercel.app
   ```

### 方法2: GitHub経由でデプロイ

1. **Gitリポジトリを初期化**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```

2. **GitHubにリポジトリを作成**し、プッシュ
   ```bash
   git remote add origin https://github.com/your-username/your-repo.git
   git branch -M main
   git push -u origin main
   ```

3. **Vercelダッシュボード**（https://vercel.com）にアクセス
   - 「New Project」をクリック
   - GitHubリポジトリをインポート
   - 設定を確認して「Deploy」

## 📱 使い方

1. **スマートフォンでURLにアクセス**
   - iOS Safari または Android Chrome 推奨
   - **HTTPS接続が必要**です（Vercelは自動でHTTPSを提供）

2. **カメラの許可**
   - ブラウザがカメラへのアクセスを要求します → 許可

3. **部屋サイズを設定**
   - 画面左上の設定パネルで部屋のサイズを入力
   - 「適用」ボタンをクリック

4. **ゲーム開始**
   - ARシーンが準備できたら「ゲーム開始」ボタンが表示されます
   - ボタンをタップしてゲーム開始

5. **Wi-Fiを追いかけろ！**
   - スマホを動かしてWi-Fiオブジェクトを探す
   - 距離表示とビープ音で近づく
   - 近づいて画面内に収めたら自動でゲット！

## ⚙️ 技術スタック

- **A-Frame 1.6.0** - WebVR/ARフレームワーク
- **AR.js 3.4.7** - ブラウザベースAR
- **Web Audio API** - 音声フィードバック

## 📝 注意事項

- **HTTPS必須**: AR.jsはHTTPS接続が必要です（Vercelは自動で提供）
- **カメラ権限**: ブラウザでカメラへのアクセスを許可する必要があります
- **モバイル推奨**: スマートフォンでの利用を想定しています
- **iOS Safari**: 初回タップで音声が有効化されます

## 🔧 カスタマイズ

`index.html`内の以下の定数を変更することで、ゲームの挙動を調整できます：

- `CATCH_DISTANCE`: ゲット判定の距離（デフォルト: 1.2m）
- `MOVE_SPEED`: Wi-Fiの移動速度（デフォルト: 0.8 m/s）
- `WIFI_SSID` / `WIFI_PASS`: 表示するWi-Fi情報
