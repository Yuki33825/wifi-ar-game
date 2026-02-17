# Vercel CLI を対話モードで動かす方法

## 非対話モードになる主な理由

Vercel CLI が非対話モードになるのは、次のどれかに当てはまるときです。

| 条件 | 説明 |
|------|------|
| **1. `CI` 環境変数がセットされている** | `CI=true` や `CI=1` などがあると「CI環境」と判断され、質問を出さずにエラーや案内だけ返す |
| **2. 標準入力が TTY ではない** | スクリプトや IDE の「ターミナル実行」、パイプ、リダイレクトなどで起動すると `stdin` が TTY にならず、対話できない |
| **3. `--yes` を付けている** | `vercel --yes` は「全部デフォルトで進める」指定なので、質問は出ない |

---

## 対話モードにする手順

### 1. `CI` を外す

**シェルでその場だけ外す（macOS/Linux）:**
```bash
unset CI
npx vercel --prod
```

**コマンドの前だけで外す:**
```bash
CI= npx vercel --prod
```

**Windows (PowerShell):**
```powershell
$env:CI = $null
npx vercel --prod
```

**Windows (コマンドプロンプト):**
```cmd
set CI=
npx vercel --prod
```

### 2. 「本当のターミナル」から実行する

- **Cursor / VSCode の「ターミナル」パネル**で実行する  
  → 多くの場合、ここでは TTY として動くので対話できる
- **OS のターミナル（iTerm2、Terminal.app、PowerShell など）**を開き、そこで  
  `cd プロジェクトのパス` → `npx vercel --prod` を実行する  
  → 最も確実に対話モードになる
- **npm スクリプト**（`npm run deploy`）から呼ぶ場合も、その npm を「ターミナルから」実行すれば対話できる

逆に、次のような実行では **stdin が TTY にならない**ことが多く、非対話になります。

- エディタの「Run / デバッグ」でコマンドを実行
- 別プロセスから `child_process` で起動（パイプ経由）
- CI（GitHub Actions など）上での実行

### 3. `--yes` を付けない

対話させたいときは、`vercel --prod` だけで実行し、`--yes` は付けない。

---

## このプロジェクトで対話デプロイする例

**ターミナルを開いて:**

```bash
cd "/Users/yukihirosugawara/DENTSU Internship/中間課題/中間課題v0"

# CI を外してから実行（必要なら）
unset CI
npx vercel --prod
```

または用意したスクリプト（中で `unset CI` している）を、**ターミナルから**実行:

```bash
cd "/Users/yukihirosugawara/DENTSU Internship/中間課題/中間課題v0"
./deploy.sh
```

---

## まとめ

- **非対話になる主因**: `CI` の有無・**実行元が TTY かどうか**・`--yes` の有無  
- **対話にしたいとき**:  
  - `CI` を外す（`unset CI` や `CI= npx vercel --prod`）  
  - エディタや CI ではなく、**OS のターミナル**で `npx vercel --prod` を実行する  
  - `--yes` は使わない  

これで Vercel CLI を対話モードで動かせます。
