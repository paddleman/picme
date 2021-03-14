defmodule Picme.Images.Image do
  use Ecto.Schema
  use Waffle.Ecto.Schema

  import Ecto.Changeset

  alias PicmeWeb.Uploaders.Image
  alias Picme.Images.ExifInfo

  schema "images" do
    field :caption, :string
    field :date_taken, :date
    field :latitude, :float
    field :longitude, :float
    field :altitude, :float
    field :orig_height, :integer
    field :orig_width, :integer
    field :name, Image.Type

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:name, :caption])
    |> cast_attachments(attrs, [:name])
    |> validate_required([:name])
  end

  # def changeset_with_metadata(image, attrs, metadata)
  #   |>changeset(image, attrs)
  #   |>cast(metadata,[:date_taken, :latitude, :longitude, :altitude, :orig_height, :orig_width])
  # end

end
# Testing in the REPL

# > alias Picme.Images.Image
# > attrs = %{ name: "/home/dj/Pictures/from_phone/IMG_20200914_131554.jpg", caption: "Hawks Creek upstream" }
# > pic = Image.changeset(%Image{}, attrs)
# > Picme.Repo.insert pic
# > Picme.Images.list_images()

# > test_pic = Picme.Images.get_image!(3)

# > src_url = PicmeWeb.Uploaders.Image.url(test_pic.name.file_name)

# > url = "." <> src_url
