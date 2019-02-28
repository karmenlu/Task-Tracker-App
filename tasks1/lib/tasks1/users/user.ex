defmodule Tasks1.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :name, :string
    has_many :tasksCreated, Tasks1.Tasks.Task, foreign_key: :creator_id
    has_many :tasksAssigned, Tasks1.Tasks.Task, foreign_key: :doer_id
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
