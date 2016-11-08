defmodule DJB.DelayedJobController do
  use DJB.Web, :controller
  alias DJB.DelayedJob

  def index(conn, _params) do
    # delayed_jobs_with_app = [{"my_app", DJB.Repos.MyAppRepo}]
                            # |> Enum.map(fn({app, repo}) -> {app, DelayedJob |> repo.all} end)
    delayed_jobs_with_app = []
    render conn, "index.html", delayed_jobs_with_app: delayed_jobs_with_app, layout: {DJB.LayoutView, "delayed_job.html"}
  end

  def delete(conn, %{"id" => id, "application" => _application}) do
    # repo = case application do
      # "my_app" -> DJB.Repos.MyAppRepo
    # end
    # DelayedJob |> repo.get(id) |> repo.delete

    conn
    |> put_flash(:info, "Successfully delete the job")
    |> redirect(to: delayed_job_path(conn, :index))
  end
end
