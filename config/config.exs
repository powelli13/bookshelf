# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bookshelf,
  ecto_repos: [Bookshelf.Repo]

# Configures the endpoint
config :bookshelf, BookshelfWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7CKZE97bzPl05i0VSot2/DeiCJqrd7LmLQrn/YZ0/rKMOYlw0X678m2ZKxKzTmO+",
  render_errors: [view: BookshelfWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Bookshelf.PubSub,
  live_view: [signing_salt: "ObGvt4GQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
