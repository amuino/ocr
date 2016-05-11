defmodule Ocr do
  def from_path(path), do: path |> File.read! |> Ocr.from_image

  def from_image(image_data), do: image_data |> Base.encode64 |> Ocr.from_base64

  def from_base64(base64) do
    Ocr.GoogleVision.extract_text(base64)
  end
end
