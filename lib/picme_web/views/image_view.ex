defmodule PicmeWeb.ImageView do
  use PicmeWeb, :view
  use JaSerializer.PhoenixView

  alias PicmeWeb.Uploaders.Image

  location "image/:id"

  attributes [:name, :src_url, :caption, :latitude, :longitude, :date_taken]


  def src_url(image, _conn) do

    "." <> Image.url(image.name.file_name)

  end
end
