# 🚀 Vercelデプロイ手順

## 方法1: デプロイスクリプトを使用（最も簡単・推奨）

### macOS/Linuxの場合:
```bash
cd "/Users/yukihirosugawara/DENTSU Internship/中間課題/中間課題v0"
./deploy.sh
```

### Windowsの場合:
```bash
cd "C:\Users\yukihirosugawara\DENTSU Internship\中間課題\中間課題v0"
deploy.bat
```

スクリプトが対話形式で質問しますので、指示に従って入力してください。

---

## 方法2: npmスクリプトを使用

```bash
cd "/Users/yukihirosugawara/DENTSU Internship/中間課題/中間課題v0"
npm run deploy
```

---

## 方法3: Vercel CLIで直接デプロイ

### ステップ1: プロジェクトディレクトリに移動
```bash
cd "/Users/yukihirosugawara/DENTSU Internship/中間課題/中間課題v0"
```

### ステップ2: Vercelにログイン（初回のみ）
```bash
npx vercel login
```
ブラウザが開くので、Vercelアカウントでログインしてください。

### ステップ3: デプロイ実行（対話モード）
```bash
CI= npx vercel --prod
```

**注意**: `CI=` を前に付けることで、対話モードを強制します。

初回デプロイ時は、以下の質問に答えてください：
- **Set up and deploy?** → `Y` を入力
- **Which scope?** → あなたのアカウントを選択
- **Link to existing project?** → `N` を入力（新規プロジェクトの場合）
- **What's your project's name?** → プロジェクト名を入力（例: `wifi-ar-game`）
- **In which directory is your code located?** → `./` を入力（そのままEnterでもOK）

### ステップ4: デプロイ完了
デプロイが完了すると、以下のようなURLが表示されます：
```
🔗  Production: https://your-project-name.vercel.app
```

このURLをスマートフォンで開けば、ARゲームを体験できます！

---

## 方法2: GitHub経由でデプロイ

### ステップ1: Gitリポジトリを初期化
```bash
cd "/Users/yukihirosugawara/DENTSU Internship/中間課題/中間課題v0"
git init
git add .
git commit -m "Initial commit: AR Wi-Fi game"
```

### ステップ2: GitHubにリポジトリを作成
1. https://github.com にアクセス
2. 「New repository」をクリック
3. リポジトリ名を入力（例: `wifi-ar-game`）
4. 「Create repository」をクリック

### ステップ3: GitHubにプッシュ
```bash
git remote add origin https://github.com/あなたのユーザー名/wifi-ar-game.git
git branch -M main
git push -u origin main
```

### ステップ4: Vercelでデプロイ
1. https://vercel.com にアクセス
2. 「Sign Up」または「Log In」でログイン
3. 「Add New...」→「Project」をクリック
4. GitHubリポジトリを選択（`wifi-ar-game`）
5. 「Deploy」をクリック

デプロイ完了後、URLが表示されます！

---

## 📱 動作確認

デプロイ後、以下の手順で動作確認してください：

1. **スマートフォンでURLにアクセス**
   - iOS Safari または Android Chrome 推奨
   - **HTTPS接続**になっていることを確認（Vercelは自動でHTTPSを提供）

2. **カメラの許可**
   - ブラウザがカメラへのアクセスを要求します → **許可**

3. **ゲーム開始**
   - 部屋サイズを設定
   - 「ゲーム開始」ボタンをタップ
   - Wi-Fiオブジェクトを追いかけます！

---

## ⚠️ 注意事項

- **HTTPS必須**: AR.jsはHTTPS接続が必要です（Vercelは自動で提供）
- **カメラ権限**: ブラウザでカメラへのアクセスを許可する必要があります
- **モバイル推奨**: スマートフォンでの利用を想定しています

---

## 🔄 更新方法

コードを変更した後、再デプロイするには：

**CLIの場合:**
```bash
npm run deploy
# または
./deploy.sh  # macOS/Linux
# または
deploy.bat   # Windows
```

**GitHub経由の場合:**
```bash
git add .
git commit -m "Update game"
git push
```
Vercelが自動的に再デプロイします。
