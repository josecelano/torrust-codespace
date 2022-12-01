# How to install Torrust Tracker for development

This tutorial only helps you to setup all the projects together with default settings and may not be updated. Please refer to the official documentation for instructions about hot to install each service, and for a more accurate list of system dependencies.

## Requirements

- rustc 1.66.0-nightly (06f049a35 2022-10-17)
- cargo 1.66.0-nightly (b332991a5 2022-10-13)
- sqlx-cli v0.6.0
- node v16.18.0

## Install

```s
cd /tmp
git@github.com:josecelano/torrust-codespace.git
cd torrust-codespace
./setup-dependencies.sh
./setup.sh
```

## Run

> NOTICE: you can run each service (tracker, backend, and frontend) in a different console tab so that you can see the service output while coding.

Run the tracker:

```s
cd tracker
cargo run
```

After running the tracker the first time you will see an error message:

```s
    Finished dev [optimized + debuginfo] target(s) in 0.10s
     Running `target/debug/torrust-tracker`
No config file found.
Creating config file..
thread 'main' panicked at 'Please edit the config.TOML in the root folder and restart the tracker.', src/main.rs:22:13
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
```

A new file should have been created in the tracker folder: `config.toml`

You have to run the tracker again and now it will start:

```s
$ cargo run
    Finished dev [optimized + debuginfo] target(s) in 0.64s
     Running `target/debug/torrust-tracker`
2022-12-02T10:06:07.162082029+00:00 [torrust_tracker::logging][INFO] logging initialized.
2022-12-02T10:06:07.162120753+00:00 [torrust_tracker::jobs::tracker_api][INFO] Starting Torrust API server on: 127.0.0.1:1212
2022-12-02T10:06:07.163194898+00:00 [torrust_tracker::jobs::tracker_api][INFO] Torrust API server started
```

Run the backend:

```s
cd index-backend
cargo run
```

```s
$ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.43s
     Running `target/debug/main`
Listening on 0.0.0.0:3000

```

Run the frontend:

```s
cd index-frontend
cargo run
```

```s
$ npm run serve
  vite v2.9.15 dev server running at:

  > Local: http://localhost:8080/
  > Network: use `--host` to expose

  ready in 220ms.
```

You you can load this url on  your browser <http://localhost:8080>.

You can sig up. The first registered user is an admin.

## Test

You can run test with `cargo test` in all the services.

The backend needs a running MySQL instance for database integration tests. You can run it with:

```s
cd index-backend/
docker-compose -f tests/docker-compose.yml up
```
