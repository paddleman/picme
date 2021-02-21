# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :picme,
  ecto_repos: [Picme.Repo]

# Configures the endpoint
config :picme, PicmeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "x7Hb9U1uL6dG1rYYCGdn4frdZYYWooeoulS8AFp4b4oyVt7rQ4Dyl6zri1YIjqi6",
  render_errors: [view: PicmeWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Picme.PubSub,
  live_view: [signing_salt: "XYGWyYRx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

#ja_serializer setup
config :phoenix, :format_encoders,
  "json-api": Jason

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

# geo_postgis to use Jason
config :geo_postgis,
json_library: Jason

config :waffle,
  storage: Waffle.Storage.Local,
  # in order to have a different storage directory from url
  storage_dir: "./uploads"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

import_config "#{Mix.env()}.exs"
