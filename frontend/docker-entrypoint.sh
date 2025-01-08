#!/bin/sh
set -e  # エラー時に停止する

# プロジェクトが存在しない場合にのみ create-next-app を実行
if [ ! -d "$SYSTEM_NAME_FRONTEND" ]; then
    echo "Creating a new Next.js project..."

    # CI環境変数を設定して create-next-app を実行
    export CI=true
    npx create-next-app@latest "$SYSTEM_NAME_FRONTEND" \
      --typescript \
      --no-tailwind \
      --eslint \
      --use-yarn \
      --no-src-dir \
      --app \
      --no-turbopack \
      --no-import-alias

    # 作成されたプロジェクトのディレクトリに移動
    cd "$SYSTEM_NAME_FRONTEND"

    # 依存関係のインストール（初回のみ）
    echo "Installing dependencies..."
    yarn install --frozen-lockfile
else
    echo "'$SYSTEM_NAME_FRONTEND' already exists. Skipping project creation."
    cd "$SYSTEM_NAME_FRONTEND"
fi

    # 開発サーバーを起動
    echo "Starting the dev server..."
    yarn dev