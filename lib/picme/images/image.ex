defmodule Picme.Images.Image do
  use Ecto.Schema
  use Waffle.Ecto.Schema

  import Ecto.Changeset

  alias PicmeWeb.Uploaders.Image

  schema "images" do
    field :caption, :string
    field :date_taken, :date
    field :latitude, :float
    field :longitude, :float
    field :name, Image.Type

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:name, :caption, :latitude, :longitude, :date_taken])
    |> cast_attachments(attrs, [:name])
    |> validate_required([:name])

  end
end
