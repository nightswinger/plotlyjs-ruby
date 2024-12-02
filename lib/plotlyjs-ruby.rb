require 'json'

require_relative 'plotlyjs/chart'
require_relative 'plotlyjs/version'

module Plotlyjs
  class << self
    def new_plot(data, layout = {}, config = {})
      chart = Chart.new(data, layout, config)
      chart.to_html
    end
  end
end
