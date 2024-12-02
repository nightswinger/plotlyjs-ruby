require 'json'

require_relative 'plotlyjs/version'

module Plotlyjs
  class << self
    def new_plot(data, layout = {}, config = {})
      chart = Chart.new(data, layout, config)
      chart.to_html
    end
  end

  class Chart
    attr_reader :data, :layout, :config

    def initialize(data, layout, config)
      @data = data
      @layout = layout
      @config = config
    end

    def to_html
      element_id = "plotly-chart-#{self.object_id}"

      js_vars = {
        data: data.to_json,
        layout: layout.to_json,
        config: config.to_json
      }

      createjs = "Plotly.newPlot('#{element_id}', %{data}, %{layout}, %{config});" % js_vars

      html = <<~HTML
        <div id="#{element_id}"></div>
        <script>
          (function() {
            var createChart = function() { #{createjs} };

            if ("Plotly" in window) {
              createChart();
            } else {
              window.addEventListener('load', createChart);
            };
          })();
        </script>
      HTML

      html.respond_to?(:html_safe) ? html.html_safe : html
    end
  end
end
