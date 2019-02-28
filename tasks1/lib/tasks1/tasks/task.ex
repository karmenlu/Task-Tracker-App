defmodule Tasks1.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completeHuh, :boolean, default: false
    field :description, :string
    field :timeSpent, :integer
    field :title, :string
    # field :creator, :id
    #field :doer, :id
    belongs_to :creator, Tasks1.Users.User
    belongs_to :doer, Tasks1.Users.User

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :completeHuh, :timeSpent])
    |> validate_required([:title, :description, :completeHuh, :timeSpent])
  end
end
