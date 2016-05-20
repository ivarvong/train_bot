defmodule MTA do

  def lines do
    ["123", "456", "7", "ACE", "BDFM", "G", "JZ", "L", "NQR", "S"]
  end

  def url(line) do
    "http://www.mta.info/status/subway/#{line}"
  end

  def get_html(line) do
    case HTTPoison.get(url(line)) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def get_selector(line, selector) do
    {:ok, html} = get_html(line)
    Floki.find(html, selector)
  end

  def status(line) do
    get_selector(line, "#status_display")
      |> Floki.raw_html
  end

  def statuses do
    lines |> Enum.map(fn line ->
      %{
        line: line,
        status: status(line)
      }
    end)
  end

  def statuses_json do
    {:ok, json} = Poison.encode(statuses, pretty: true)
    json
  end

end
