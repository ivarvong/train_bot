defmodule TrainBot.Web do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    IO.inspect conn

    json = MTA.statuses_json
    send_resp(conn, 200, json)
  end

  get "/favicon.ico" do
    send_resp(conn, 200, "")
  end

end
