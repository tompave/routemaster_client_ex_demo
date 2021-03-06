defmodule RmDemoWeb.Router do
  use RmDemoWeb, :router

  pipeline :browser do
    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart],
      pass: ["*/*"],
      json_decoder: Poison

    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug Plug.Parsers,
      parsers: [:json],
      pass: ["*/*"],
      json_decoder: Poison

    plug :accepts, ["json"]
  end

  scope "/", RmDemoWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", RmDemoWeb do
  #   pipe_through :api
  # end

  scope path: "/events" do
    forward "/", RmDemoWeb.Drain
  end

  # forward "/events", RmDemoWeb.Drain
end
