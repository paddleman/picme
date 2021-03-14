defmodule Picme.Repo.Migrations.AddFieldsToImages do
  use Ecto.Migration

  def change do
    alter table("images") do
      add :altitude, :float
      add :orig_height, :integer
      add :orig_width, :integer

    end

  end
end
