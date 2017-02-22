defmodule VerkWeb.RetriesView do
  use VerkWeb.Web, :view

  def jobs(failed_jobs) do
    Enum.map failed_jobs, fn {failed_job, score} ->
      %{
        jid: failed_job.jid,
        retry_count: failed_job.retry_count,
        score: score |> format_timestamp,
        class: failed_job.class,
        args: failed_job.args |> inspect,
        original_json: failed_job.original_json,
        job: failed_job
      }
    end
  end

  defp format_timestamp(timestamp), do: timestamp |> DateTime.from_unix! |> DateTime.to_iso8601
end
