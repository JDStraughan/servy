defmodule Servy.Handler do

  def handle(request) do
    request
    |> parse()
    |> log()
    |> route()
    |> format_response()
  end

  def parse(request) do
    [method, path, _] =
      request
      |> String.split("\n")
      |> List.first
      |> String.split(" ")

    %{ method: method, path: path, resp_body: "" }
  end

  def log(conv), do: IO.inspect conv

  def route(conv), do: route(conv, conv.path)

  def route(conv, "/wildthings") do
    %{ conv | resp_body: "All the things"}
  end

  def route(conv, "/bears") do
    %{ conv | resp_body: "Da Bears"}
  end

  def format_response(conv) do
    """
    HTTP/1.1 200 OK
    Content-Type: text/html
    Content-Length: #{String.length(conv.resp_body)}

    #{conv.resp_body}
    """
  end

end

request = """
GET /wildthings HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Servy.Handler.handle(request)

IO.puts response

request = """
GET /bears HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Servy.Handler.handle(request)

IO.puts response
