# GitHubとVercelの自動デプロイ連携設定

GitHubにプッシュするたびにVercelが自動的にデプロイするように設定します。

## 方法1: Vercelダッシュボードから設定（推奨・最も簡単）

### ステップ1: Vercelにログイン
1. https://vercel.com にアクセス
2. 「Sign Up」または「Log In」でログイン

### ステップ2: GitHubアカウントを連携（初回のみ）
1. Vercelダッシュボードの右上のプロフィールアイコンをクリック
2. 「Settings」→「Connected Accounts」を選択
3. 「GitHub」の「Connect」をクリック
4. GitHubの認証画面で「Authorize Vercel」をクリック

### ステップ3: プロジェクトをインポート
1. Vercelダッシュボードの「Add New...」→「Project」をクリック
2. 「Import Git Repository」セクションで `Yuki33825/wifi-ar-game` を検索・選択
3. 「Import」をクリック

### ステップ4: プロジェクト設定
1. **Project Name**: `wifi-ar-game`（そのまま）
2. **Framework Preset**: 「Other」または「Other」を選択
3. **Root Directory**: `./`（そのまま）
4. **Build Command**: （空欄のまま）
5. **Output Directory**: （空欄のまま）
6. **Install Command**: （空欄のまま）

### ステップ5: デプロイ実行
1. 「Deploy」をクリック
2. デプロイが完了するまで待機（1-2分）

### ステップ6: 自動デプロイの確認
これで設定完了です！今後は以下のように動作します：

- **GitHubにプッシュ** → Vercelが自動的にデプロイ
- **mainブランチへのプッシュ** → 本番環境（Production）にデプロイ
- **その他のブランチへのプッシュ** → プレビュー環境にデプロイ

## 方法2: Vercel CLIで設定

### ステップ1: プロジェクトをリンク
```bash
cd "/Users/yukihirosugawara/DENTSU Internship/中間課題/中間課題v0"
npx vercel link
```

対話形式で質問されます：
- **Set up and deploy?** → `Y`
- **Which scope?** → あなたのアカウントを選択
- **Link to existing project?** → `N`（新規プロジェクトの場合）
- **What's your project's name?** → `wifi-ar-game`
- **In which directory is your code located?** → `./`

### ステップ2: GitHubと連携
Vercelダッシュボードで：
1. プロジェクトの「Settings」→「Git」を開く
2. 「Connect Git Repository」をクリック
3. `Yuki33825/wifi-ar-game` を選択
4. 「Connect」をクリック

## 動作確認

### 自動デプロイをテストする
```bash
# 小さな変更を加える（例：README.mdにコメント追加）
echo "# Test" >> README.md

# コミットしてプッシュ
git add README.md
git commit -m "Test: auto deployment"
git push
```

Vercelダッシュボードで、数秒以内に新しいデプロイが開始されることを確認できます。

## デプロイの確認方法

1. **Vercelダッシュボード**: https://vercel.com/dashboard
   - プロジェクトを選択
   - 「Deployments」タブでデプロイ履歴を確認

2. **GitHubのコミット**
   - GitHubリポジトリの各コミットにVercelのデプロイステータスが表示されます
   - ✅ 緑色のチェックマーク = デプロイ成功
   - ❌ 赤色のX = デプロイ失敗

## トラブルシューティング

### GitHubアカウントが連携されていない場合
- Vercelダッシュボードの「Settings」→「Connected Accounts」でGitHubを連携してください

### リポジトリが見つからない場合
- GitHubでリポジトリが公開（Public）になっているか確認
- または、Vercelの「Settings」→「Git」でリポジトリへのアクセス権限を確認

### デプロイが失敗する場合
- Vercelダッシュボードの「Deployments」タブでエラーログを確認
- `vercel.json`の設定が正しいか確認

## 参考リンク

- [Vercel公式ドキュメント: Git連携](https://vercel.com/docs/concepts/git)
- [GitHubリポジトリ](https://github.com/Yuki33825/wifi-ar-game)
