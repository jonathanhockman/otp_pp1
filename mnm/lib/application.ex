defmodule Mnm.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Mnm.GameServer.start_link(arg)
      {Mnm.GameServer, name: :hockman},
      {Mnm.GameServer, name: :allen},
      {Mnm.GameServer, name: :elom},
      {Mnm.GameServer, name: :elliott}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: :sup]
    Supervisor.start_link(children, opts)
  end
end
