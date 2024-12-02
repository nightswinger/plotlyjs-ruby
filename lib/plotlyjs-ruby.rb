require 'json'

require_relative 'plotlyjs/chart'
require_relative 'plotlyjs/config'
require_relative 'plotlyjs/utils'
require_relative 'plotlyjs/version'

module Plotlyjs
  class << self
    def new_plot(data, layout = {}, config = {})
      merged_config = Plotlyjs::Utils.deep_merge(configuration.options, config)

      chart = Chart.new(data, layout, merged_config)
      chart.to_html
    end

    def configuration
      @configuration ||= Config.new
    end

    def configure
      yield(configuration)
    end
  end
end
