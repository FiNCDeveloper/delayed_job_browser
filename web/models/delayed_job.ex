defmodule DJB.DelayedJob do
  use DJB.Web, :model

  schema "delayed_jobs" do
    field :priority, :integer
    field :attempts, :integer
    field :handler, :string
    field :last_error, :string
    field :run_at, Ecto.DateTime
    field :locked_at, Ecto.DateTime
    field :failed_at, Ecto.DateTime
    field :locked_by, :string
    field :queue, :string
    field :created_at, Ecto.DateTime
    field :updated_at, Ecto.DateTime
  end
end
