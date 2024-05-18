#docker buildx build --platform linux/amd64,linux/arm64 -t devtaehoon/taehoon-jekyll-blog:latest --push .

# 베이스 이미지로 Ruby 사용
FROM ruby:3.0.3

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y protobuf-compiler

# Jekyll과 필요한 gem 설치
RUN gem install google-protobuf
RUN gem install bundler


# 작업 디렉토리 설정
WORKDIR /srv/jekyll

# Gemfile과 Gemfile.lock 복사
COPY Gemfile Gemfile.lock ./

# 필요한 gem 설치
RUN bundle install

# Jekyll 사이트 파일을 복사
COPY . .

# Jekyll 빌드
RUN bundle exec jekyll build || { echo 'Jekyll build failed'; exit 1; }

# 호스트 포트와 컨테이너 포트 매핑
EXPOSE 4000

# 컨테이너 시작 시 Jekyll 서버 실행
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
