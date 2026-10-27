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

The app is at http://localhost:3000. Every page except the price list asks you to sign in.

## Accounts of the seed

These accounts and passwords exist only in development, created by `bin/rails db:seed`:

| Email address | Password | Role | Member of the staff |
|---|---|---|---|
| `rodrigo@wheelhouse.cl` | `rodrigo-wheelhouse` | owner | Rodrigo Alarcón |
| `josefa@wheelhouse.cl` | `josefa-wheelhouse` | counter | Josefa Alarcón |
| `andres@wheelhouse.cl` | `andres-wheelhouse` | mechanic | Andrés Lillo |
| `nicolas@wheelhouse.cl` | `nicolas-wheelhouse` | mechanic | Nicolás Bustos |
| `paulina@wheelhouse.cl` | `paulina-wheelhouse` | mechanic | Paulina Herrera |
| `apprentice@wheelhouse.cl` | `apprentice-wheelhouse` | mechanic | none |

## Emails in development

No email leaves the machine. Each one is written to `tmp/mails/`, in a file named after the address
it was sent to. For example, after asking for a new password for Josefa:

```bash
cat tmp/mails/josefa@wheelhouse.cl
```

The link in that email opens the form for a new password in the app running locally. The welcome
email can also be seen at http://localhost:3000/rails/mailers.

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
