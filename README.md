# Wheelhouse

Web Technologies (ICC4130) — Juan Pablo Saavedra

Wheelhouse is a system for a bicycle repair shop. The shop keeps everything on paper, so when a
customer calls to ask if their bike is ready, someone has to go to the back and check. The idea is
to have that on a screen.

For now the app only has the public pages. The repair tracking comes later in the semester.

## Documents

The spec I wrote in Lab 3:

- [`docs/user-stories.md`](docs/user-stories.md)
- [`docs/domain-model.md`](docs/domain-model.md)
- [`docs/decisions.md`](docs/decisions.md)
- [`docs/wireframes.md`](docs/wireframes.md)

## Pages

- `/` — home
- `/services` — the price list
- `/visiting` — address, hours, and what happens when you bring a bike in
- `/about` — who runs the shop

## Requirements

- Ruby 4.0.4
- Rails 8.1.3
- Node 26.1.0 and Yarn
- PostgreSQL 18, running, with a user that can create databases

I worked on WSL (Ubuntu). If PostgreSQL does not know your user yet:

```bash
sudo -u postgres createuser --superuser $(whoami)
```

## Setup

```bash
git clone https://github.com/jpsaavedra3/webtech-wheelhouse.git
cd webtech-wheelhouse
bundle install
yarn install
bin/rails db:create
```

## Running it

```bash
bin/dev
```

Then go to http://localhost:3000

Use `bin/dev`, not `bin/rails server`. `bin/dev` also compiles the Bootstrap Sass, so with
`rails server` the CSS does not update.

## Notes

- Rails 8.1 with PostgreSQL and Bootstrap 5.3
- The price list is an array in `PagesController#services`. There is no database yet, that starts
  in Lab 5
- Bootstrap is compiled from Sass, not loaded from a CDN. The variables I changed are at the top of
  `app/assets/stylesheets/application.bootstrap.scss`, before the import

- **Rails 8.1** on **PostgreSQL**
- **Bootstrap 5.3**, compiled from Sass with `cssbundling-rails`. Two variables are overridden in
  `app/assets/stylesheets/application.bootstrap.scss`, above the Bootstrap import so they take
  effect
- **importmap** for JavaScript, so there is no build step
- One controller, `PagesController`, with one action per page

## Status

- **Lab 3** — user stories, domain model, decisions and wireframes, in `docs/`
- **Lab 4** — the Rails application, the four public pages, the layout and Bootstrap ← current
- **Lab 5 onward** — the database, and the repair tracking itself