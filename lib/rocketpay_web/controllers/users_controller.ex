defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.{User, Repo}

  action_fallback RocketpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocketpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def index(conn, _params) do
    users = Repo.all(User)

    conn
    |> put_status(:created)
    |> render("index.json", users: users)
  end
end
