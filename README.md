# Plotlyjs Ruby

A lightweight and straightforward Ruby wrapper for Plotly.js, enabling developers to create interactive, high-quality data visualizations effortlessly.

## Installation

1. Add this line to your application's Gemfile:

    ```ruby
    gem "plotlyjs-ruby"
    ```

2. Run the following command to pin plotly.js-dist in the import map:

    ```bash
    bin/importmap pin plotly.js-dist
    ```

3. Add the following code to `app/javascript/application.js`:

    ```js
    import Plotly from "plotly.js-dist"

    window.Plotly = Plotly
    ```

## Usage

### Basic Usage

To create a basic plot, use the following code in your view:

```erb
<%= Plotlyjs.new_plot(
  [{ x: [1, 2, 3, 4, 5] }, { y: [1, 2, 4, 8, 16]}],
  { width: 600, height: 250, margin: { t: 0 } }
) %>
```

### Global Configuration

To set options for all of your charts, create an initializer file `config/initializers/plotlyjs-ruby.rb` with:

```ruby
Plotlyjs.configure do |config|
  config.options = {
    responsive: true,
    displayModeBar: false
  }
end
```

For more details, follow the [Plotly Getting Started Guide](https://plot.ly/javascript/getting-started/).
