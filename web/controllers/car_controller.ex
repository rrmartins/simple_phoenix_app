defmodule SimplePhoenixApp.CarController do
  use SimplePhoenixApp.Web, :controller

  alias SimplePhoenixApp.Car

  plug :find_user
  plug :action

  def index(conn, _params) do
    user = conn.assigns.user
    cars = Repo.all assoc(user, :cars)

    render conn, cars: cars, user: user
  end

  def new(conn, _) do
    changeset = Car.changeset(%Car{})
    render conn, changeset: changeset
  end

  def create(conn, %{"car" => car_params}) do
    changeset = build_assoc(conn.assigns.user, :cars)
      |> Car.changeset(car_params)

    if changeset.valid? do
      Repo.insert(changeset)
      conn
        |> put_flash(:info, "Car has been successfully created.")
        |> redirect(to: user_car_path(conn, :index, conn.assigns.user))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  defp find_user(conn, _) do
    user = Repo.get(SimplePhoenixApp.User, conn.params["user_id"])
    assign(conn, :user, user)
  end
end
