@echo off
REM Vercelデプロイスクリプト（対話モード・Windows用）

echo 🚀 Vercelデプロイを開始します...
echo.

REM プロジェクトディレクトリに移動
cd /d "%~dp0"

REM 対話モードを強制（CI環境変数を無効化）
set CI=

REM Vercel CLIコマンドを決定
where vercel >nul 2>&1
if %errorlevel% equ 0 (
    set VERCEL_CMD=vercel
) else (
    set VERCEL_CMD=npx vercel
)

echo 📦 使用するコマンド: %VERCEL_CMD%
echo.

REM プロジェクトがリンクされているか確認
if not exist ".vercel\project.json" (
    echo 🔗 プロジェクトがリンクされていません。まずリンクします...
    echo.
    %VERCEL_CMD% link
    echo.
)

REM 本番環境にデプロイ（対話モード）
echo 🌐 本番環境にデプロイします...
echo    対話形式で質問に答えてください。
echo.
%VERCEL_CMD% --prod

echo.
echo ✅ デプロイが完了しました！
echo    上記に表示されたURLをスマートフォンで開いて体験してください。

pause
