# Cloudtestapp

A simple database backed CRUD application (in this case, storing and viewing quotes) used to test CloudEndure replication.

## Installation and Setup

First, install Exlixir (see http://www.elixir-lang.org for instructions for your platform)

Requirements: Elixir, Postgres, Node.js

To get up and running:

1. Add username and password to the database section of config/dev.exs if necessary
2. Install dependencies and compile with `mix do deps.get, compile`
3. Install JS dependencies with `npm install`
4. Create the database with `mix ecto.create`
5. Run migrations with `mix ecto.migrate`
6. Build static assets with `brunch build`
7. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.

## Running in Production

To run in production:

1. Create `prod.secret.exs` based on `prod.secret.exs.example`
2. Build static assets with `brunch build --production`
3. Digest static assets with `mix phoenix.digest`
4. Start phoenix endpoint with `MIX_ENV=prod PORT=8888 mix phoenix.server` or to run detatch with `MIX_ENV=prod PORT=8888 elixir --detached -S mix phoenix.server`

Now you can access your application on the server running on port 8888, or set up Apache or nginx as a proxy.
