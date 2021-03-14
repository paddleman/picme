defmodule Picme.Images.ExifInfo do

  # def extract_metadata_from_photo(image_path) do
  #   with {:ok, info} <- Exexif.exif_from_jpeg_file(image_path) do
  #     extract_from_valid_exif(info)
  #   end
  # end

  def extract_metadata_from_photo(image_path) do
    case Exexif.exif_from_jpeg_file(image_path) do
      {:ok, info} ->
        extract_from_valid_exif(info)
      {:error, _} ->
        %{}
    end
  end

  defp extract_from_valid_exif(%{gps: gps, exif: exif}) do
    %{
      latitude: extract_geo_point(gps.gps_latitude, gps.gps_latitude_ref ),
      longitude: extract_geo_point(gps.gps_longitude, gps.gps_longitude_ref),
      altitude: gps.gps_altitude,
      date_taken: datetime_original(exif),
      orig_width: exif.exif_image_width,
      orig_height: exif.exif_image_height
    }
  end

  defp extract_geo_point(coord, ref) do
    coord
    |> from_dms_to_decimal(ref)
  end

  defp datetime_original(%{datetime_original: given_dt}), do: parse_datetime_original(given_dt)

  defp datetime_original(_), do: nil

  defp parse_datetime_original(datetime_original) do
    datetime_original
    |> String.split
    |> hd
    |> String.replace(":", "-")
    |> Date.from_iso8601!()
  end

  defp from_dms_to_decimal([d, m, s], ref) do
    decimal_version = d + (m / 60.0) + (s / 3600.0)

    case String.upcase(ref) do
      "W" -> decimal_version * -1
      "S" -> decimal_version * -1
      _   -> decimal_version
    end
  end
end
