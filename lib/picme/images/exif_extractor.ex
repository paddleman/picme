defmodule Picme.Images.ExifInfo do

  def extract_data_from_photo(image_path) do
    case Exexif.exif_from_jpeg_file!(image_path)

    {:ok, info} ->

      lat = convert_dms_to_decimal(info.gps.gps_latitude)
      long = convert_dms_to_decimal(info.gps.gps_longitude)

      {:error, _} -> %{}

    end
  end


  defp convert_dms_to_decimal([d, m, s], ref) do
    coord = d + (m / 60.0) + (s / 3600.0)

    case String.upcase(ref) do
      "W" -> coord * -1
      "S" -> coord * -1
      _   -> coord
    end
  end

end
# https://github.com/mertonium/cable_car_spotter
