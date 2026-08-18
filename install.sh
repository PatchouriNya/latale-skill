#!/usr/bin/env bash
# latale-price 一键安装（macOS / Linux）
# 用法: bash install.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DSH_HOME="${DSH_HOME:-$HOME/.dsh}"
DEST="$DSH_HOME/skills/latale-price"
SRC="$REPO_ROOT/skills/latale-price"

if [ ! -d "$SRC" ]; then
  echo "错误: 找不到 skill 源目录: $SRC" >&2
  exit 1
fi

mkdir -p "$DEST"
cp -R "$SRC/." "$DEST/"

echo "已安装 latale-price skill 到:"
echo "  $DEST"
echo "重开会话即可使用。"
