# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bookshelf, Bookshelf.Repo,
  database: "bookshelf_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

config :bookshelf,
  ecto_repos: [Bookshelf.Repo]

# Configures the endpoint
config :bookshelf, BookshelfWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uvPiO9NNQfnic0WquMpxlfGcGg/rI+VAGyNjTA0qqxm3A1WSfMQhrEPt/CCQbo/H",
  render_errors: [view: BookshelfWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Bookshelf.PubSub,
  live_view: [signing_salt: "mqCYxKye"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
