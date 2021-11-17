FROM ruby:3.0-alpine AS build

WORKDIR /operator-build

COPY . .

RUN bundle config set --local path 'vendor/bundle' && bundle install
RUN bundle exec ruby bundle_manifest.rb
RUN mkdir workspace && cp -R vendor opentelemetry-instrument.rb __opentelemetry-rails-initializer.rb workspace

FROM busybox

COPY --from=build /operator-build/workspace /autoinstrumentation
