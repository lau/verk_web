defmodule VerkWeb.SharedView do
  use VerkWeb.Web, :view

  def enqueued_at(nil), do: "N/A"
  def enqueued_at(timestamp) do
    timestamp |> format_timestamp
  end

  defp format_timestamp(timestamp), do: timestamp |> DateTime.from_unix! |> DateTime.to_iso8601
end
