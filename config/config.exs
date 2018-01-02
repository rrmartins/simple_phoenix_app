# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :simple_phoenix_app,
  ecto_repos: [SimplePhoenixApp.Repo]

# Configures the endpoint
config :simple_phoenix_app, SimplePhoenixApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sMUU9FwGKmOxYAmF76n19H8ZeNcmfexopf9AxRcwHpd6n49x6PX65np6yi/Gw1P3",
  render_errors: [view: SimplePhoenixApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SimplePhoenixApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
