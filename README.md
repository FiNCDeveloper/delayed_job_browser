# DJB

## What's this ?

This application is the `delayed job browser`.

Through this application, you can

  * see what jobs are queued in delayed job over multi databases.
  * delete queues job because of, for example, a kind of errors.

## Installation

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Add delayed job repository

### 1. Add a repository file under `lib/delayed_job_browser/repos` directory, such as my_app_repo.ex.

```ex

defmodule DJB.Repos.MyAppRepo do
  use Ecto.Repo, otp_app: :delayed_job_browser
end
```

### 2. Notify this repo class to supervisor in `lib/delayed_job_browser.ex` .

```ex

(omit)
      supervisor(DJB.Repo, []),
      supervisor(DJB.Repos.MyAppRepo, []),  # <= Add this line.
(omit)
```

### 3. Add database configuration to config/{env}.exs

```ex

config :delayed_job_browser, DJB.Repos.MyApp,
 adapter: Ecto.Adapters.MySQL,
 username: "root",
 password: "",
 database: "my_app_#{environment}",
 hostname: "localhost",
 pool_size: 10,
 priv: "priv/repos/my_app_repo"
```

### 4. Make directory to store migration file for that app if you need.

```sh
$ mkdir priv/repos/my_app_repo
```

### 5. Add application settings to delayed_job_controller#index

```ex
delayed_jobs_with_app = [{"my_app", DJB.Repos.MyAppRepo}]
                        Enum.map(fn({app, repo}) -> {app, DelayedJob |> repo.all} end)
# delayed_jobs_with_app = [] # Remove this line
```

### 6. Add application settings to delayed_job_controller#destroy

```ex
repo = case application do
  "my_app" -> DJB.Repos.MyAppRepo
end
DelayedJob |> repo.get(id) |> repo.delete
```

### 7. Enjoy !!

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
