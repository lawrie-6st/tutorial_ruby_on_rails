FROM ruby:2.7.0
# Debianディストリビューションのパッケージマネージャーのアップデート
RUN apt-get update -qq
# nodejsとsqliteのインストール
RUN apt-get install -y nodejs sqlite3
# yarnを入れる
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - &&\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
    apt-get update && apt-get install -y nodejs yarn --no-install-recommends && rm -rf /var/lib/apt/lists/*
# dockerの内部に基盤となるディレクトリを作る
RUN mkdir /tutorial_ruby_on_rails
# 基本となるパスを設定する。
WORKDIR /tutorial_ruby_on_rails
# gemfileをdocker内にコピーする。
COPY Gemfile /tutorial_ruby_on_rails/Gemfile
# gemlockをdocker内にコピーする。
COPY Gemfile.lock /tutorial_ruby_on_rails/Gemfile.lock
RUN yarn install --check-files
RUN gem install bundler:2.1.4
RUN bundle install
# 全てのファイルをdocker内コピーする。
COPY . /tutorial_ruby_on_rails

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
# イニシャライザの役割を果たしている。DBが立ち上がっている場合は一度落としてくれる。
ENTRYPOINT ["entrypoint.sh"]
# t is not necessary.
# if there is no EXPOSE on dockerfile,all of port is opened.
#EXPOSE 3000

# Start the main process.
CMD ["rails", "server"]