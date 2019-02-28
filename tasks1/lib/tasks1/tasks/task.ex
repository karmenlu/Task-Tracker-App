defmodule Tasks1.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completeHuh, :boolean, default: false
    field :description, :string
    field :timeSpent, :integer
    field :title, :string
    belongs_to :creator, Tasks1.Users.User
    belongs_to :doer, Tasks1.Users.User

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :completeHuh, :timeSpent, :creator_id, :doer_id])
    |> validate_required([:title, :description, :completeHuh, :timeSpent, :creator_id, :doer_id])
  end
end
