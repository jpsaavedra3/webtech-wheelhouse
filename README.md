# Wheelhouse

Web Technologies (ICC4130) — Juan Pablo Saavedra

## Requirements

- Ruby 4.0.4
- Node 26 and Yarn
- PostgreSQL 18, running, with a user that can create databases
- libvips, for the thumbnails of the photos

On Ubuntu (I used WSL):

```bash
sudo apt install libvips
sudo service postgresql start
sudo -u postgres createuser --superuser $(whoami)    # only if PostgreSQL does not know your user
```

## Setup

```bash
git clone https://github.com/jpsaavedra3/webtech-wheelhouse.git
cd webtech-wheelhouse
bundle install
yarn install
bin/rails db:create db:migrate db:seed
```

## The API token

Reading repairs and creating a service need a token. Mine is in the encrypted credentials and
`config/master.key` is not in the repository, so make your own for development:

```bash
bin/rails secret
EDITOR=nano bin/rails credentials:edit --environment development
```

Add this line with the string `bin/rails secret` printed, then save (`Ctrl+O`, `Enter`) and close
(`Ctrl+X`):

```yaml
api_token: the-string-it-printed
```

## Running it

```bash
bin/dev
```

The app is at http://localhost:3000.

## Asking the API from the terminal

The price list is public:

```bash
curl http://localhost:3000/api/v1/services
```

The repairs need the token:

```bash
curl -H "Authorization: Bearer the-string-it-printed" http://localhost:3000/api/v1/repairs
```

## The price list on my personal page

https://jpsaavedra3.github.io/webtech-lab-01/#precios reads the price list from this API. It looks
for it at `http://localhost:3000`, so the app has to run on **port 3000**, the one `bin/dev` uses.