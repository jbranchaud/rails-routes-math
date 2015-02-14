# rails-routes-math

> Do math in your rails routes.

First, check out [`config/routes.rb`](config/routes.rb), all the business
logic is there. Then see the [demo](https://secret-waters-8771.herokuapp.com/9/times/5).

## Up and running

Make sure all your dependencies are covered:

```bash
bundle install
```

Start up the Rails server:

```bash
rails s
```

The server will now be running locally at `localhost:3000`.

### Do some addition

Navigating to `/2/plus/2` will render a page with `4`.

### Do some subtraction

Navigating to `/3/minus/-3` will render a page with `6`.

### Do some multiplication

Navigating to `/-4/times/3` will render a page with `-12`.

### Do some division

Navigating to `/9/by/3` will render a page with `3`.

## License

&copy; 2015 Josh Branchaud

This project is licensed under the MIT license. See `LICENSE` for details.
