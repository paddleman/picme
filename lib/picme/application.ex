defmodule Picme.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Picme.Repo,
      # Start the Telemetry supervisor
      PicmeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Picme.PubSub},
      # Start the Endpoint (http/https)
      PicmeWeb.Endpoint
      # Start a worker by calling: Picme.Worker.start_link(arg)
      # {Picme.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Picme.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PicmeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
