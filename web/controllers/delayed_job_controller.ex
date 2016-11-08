defmodule DJB.DelayedJobController do
  use DJB.Web, :controller
  alias DJB.DelayedJob

  def index(conn, _params) do
    delayed_jobs_with_app = []
                            |> Enum.map(fn({app, repo}) -> {app, DelayedJob |> repo.all} end)

    render conn, "index.html", delayed_jobs_with_app: delayed_jobs_with_app, layout: {DJB.LayoutView, "delayed_job.html"}
  end

  def delete(conn, %{"id" => id, "application" => application}) do
    repo = case application do
    end
    DelayedJob |> repo.get(id) |> repo.delete

    conn
    |> put_flash(:info, "Successfully delete the job")
    |> redirect(to: delayed_job_path(conn, :index))
  end
end
