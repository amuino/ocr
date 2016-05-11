defmodule Ocr.GoogleVision do
  @url "https://vision.googleapis.com/v1/images:annotate"
  @feature_text_detection "TEXT_DETECTION"
  @auth_scope "https://www.googleapis.com/auth/cloud-platform"

  def extract_text(image64) do
    image64 |>
      make_request |>
      read_body
  end

  def make_request(image64), do: HTTPoison.post!(@url, payload(image64), headers)

  def read_body(%HTTPoison.Response{body: body, status_code: 200}) do
    body |>
      Poison.decode! |>
      get_in(["responses", &first/3, "textAnnotations", &first/3, "description"])
  end

  defp first(:get, data, next) do
    data |> List.first |> next.()
  end

  defp payload(image64) do
    %{requests: [
         %{image: %{content: image64},
           features: [%{type: @feature_text_detection}]}
       ]
     } |> Poison.encode!
  end

  defp headers do
    {:ok, token} = Goth.Token.for_scope(@auth_scope)
    [{"Authorization", "#{token.type} #{token.token}"}]
  end
end
