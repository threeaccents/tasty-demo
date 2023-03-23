# Tasty

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Setting up application

### Setup database

```bash
mix ecto.create
mix ecto.migrate
```

### Import data

To begin using Tasty you must first import the truck data to the database.
We created a mix task to facilitate this for you.

```bash
mix import_data
```

## API documentation

Tasty is a very simple application with only 1 endpoint. 
Call the `/trucks` endpoint to get a list of all available food trucks.

You can filter trucks by
- name (exact name)
- address (searchable)
- permit (exact permit)
- approval (boolean)
- items (searchable)

The filter keys map to url query params. For example if you want to filter by name you can do so by:
`/trucks?name=Bonito Poke`.

You may use 1 or all filters to find the perfect truck for you!
Ex. `/trucks?name=Bonito Poke&address=2511`



