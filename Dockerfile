FROM elixir:1.14-alpine as build
WORKDIR /app
RUN apk update && \
    apk add --no-cache build-base npm git inotify-tools
COPY setup.sh mix.exs mix.lock package.json package-lock.json ./
RUN chmod +x /app/setup.sh
RUN mix local.hex --force && \
    mix local.rebar --force
RUN mix deps.get
RUN npm install
COPY . .
RUN mix compile
EXPOSE 4000
CMD ["mix", "phx.server"]
