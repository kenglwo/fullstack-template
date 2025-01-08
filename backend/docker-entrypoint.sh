#!/bin/sh
set -e

# プロジェクトが存在しない場合にのみ create-next-app を実行
if [ ! -d "$SYSTEM_NAME_BACKEND" ]; then
    echo "Creating a new rails project..."
    rails new "$SYSTEM_NAME_BACKEND" --api

else
    echo "'$SYSTEM_NAME_BACKEND' already exists. Skipping project creation."
fi

# 作成されたプロジェクトのディレクトリに移動
cd "$SYSTEM_NAME_BACKEND"
bundle install
# 開発サーバーを起動
echo "Starting the dev server..."
bin/rails server -b '0.0.0.0' -p 3001