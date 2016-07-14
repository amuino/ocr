# Ocr

A simple Elixir API for using the [Google Vision API](https://cloud.google.com/vision/) OCR.

## Configuration

You will need to create a project and get the JSON credentials [from your Google Console](https://console.cloud.google.com/apis/credentials).

Then save the file as `config/google-creds.json`

Be sure to get all dependencies:
```
mix deps.get
```

## Playing


Start up a REPL with
```
iex -S mix
```

Then use the methods in the `Ocr` module to get some text back:

```
iex(1)> Ocr.from_url "http://ih0.redbubble.net/image.16611809.2383/fc,550x550,black.jpg"
"GETS ELIKIR PR ACCEPTED\nI SAID WHO WANTS TO\nFUCKING TOUCH ME?\nSuranyami\n"
```
