# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :delayed_job_browser,
  namespace: DJB,
  ecto_repos: [DJB.Repo]

# Configures the endpoint
config :delayed_job_browser, DJB.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zazQm8lkZXpVmv3TqD92MoAS2z27qCTPBNef+23t6Xx43augjAhv8l2laDVdlrN4",
  render_errors: [view: DJB.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DJB.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
