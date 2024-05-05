# 最新のrubyイメージを取得
FROM ruby:3.2.2

# 環境変数
ENV APP_HOME /app
ENV TZ Asia/Tokyo
ENV PORT 3001
ENV HOST 0.0.0.0

# WORKDIR：作業ディレクトリ
WORKDIR ${APP_HOME}

# ローカルのGemfileをコンテナ内の/app/Gemfileに
COPY Gemfile ${APP_HOME}/Gemfile
COPY Gemfile.lock ${APP_HOME}/Gemfile.lock

# Node.jsとYarnをインストール
RUN apt-get update && \
    apt-get install -y default-mysql-client git && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn

# Gemをアップデート
RUN bundle install

COPY . ${APP_HOME}

# コンテナ起動時に実行させるスクリプト
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE ${PORT}

# コンテナ実行時にRails サーバ起動
CMD ["bundle", "exec", "rails", "server", "-b", ${HOST}]