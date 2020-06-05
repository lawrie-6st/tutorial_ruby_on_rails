#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /tutorial_ruby_on_rails/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

# https://qiita.com/bashaway/items/e6279ba432d18c2d4299
# dockerのbashprofileみたいなもんらしい。
# shellcheck disable=SC1115