defmodule SimplePhoenixApp.UserTest do
  use SimplePhoenixApp.ModelCase

  alias SimplePhoenixApp.User

  @valid_attrs %{email: "some email", name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
