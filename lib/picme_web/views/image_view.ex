defmodule PicmeWeb.ImageView do
  use PicmeWeb, :view
  use JaSerializer.PhoenixView

  location "image/:id"

  attributes [:name, :url, :caption, :latitude, :longitude, :date_taken]


  def url(image) do
    IO.inspect(Picme.ImageUploader.url(image.image.file_name))

    Picme.ImageUploader.url(image.image.file_name)
  end
end
