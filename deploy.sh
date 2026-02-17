#!/bin/bash

# Vercelデプロイスクリプト（対話モード）

echo "🚀 Vercelデプロイを開始します..."
echo ""

# プロジェクトディレクトリに移動
cd "$(dirname "$0")"

# 対話モードを強制（CI環境変数を無効化）
unset CI

# Vercel CLIがインストールされているか確認
if ! command -v vercel &> /dev/null && ! command -v npx &> /dev/null; then
    echo "❌ エラー: Vercel CLIまたはnpxが見つかりません"
    echo "   npmがインストールされていることを確認してください"
    exit 1
fi

# Vercel CLIコマンドを決定（vercelコマンドがあればそれを使う、なければnpx vercel）
if command -v vercel &> /dev/null; then
    VERCEL_CMD="vercel"
else
    VERCEL_CMD="npx vercel"
fi

echo "📦 使用するコマンド: $VERCEL_CMD"
echo ""

# プロジェクトがリンクされているか確認
if [ ! -f ".vercel/project.json" ]; then
    echo "🔗 プロジェクトがリンクされていません。まずリンクします..."
    echo ""
    $VERCEL_CMD link
    echo ""
fi

# 本番環境にデプロイ（対話モード）
echo "🌐 本番環境にデプロイします..."
echo "   対話形式で質問に答えてください。"
echo ""
$VERCEL_CMD --prod

echo ""
echo "✅ デプロイが完了しました！"
echo "   上記に表示されたURLをスマートフォンで開いて体験してください。"
