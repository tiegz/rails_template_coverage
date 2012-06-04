require 'rails_template_coverage'

module RailsTemplateCoverage
  require 'rails'

  class Railtie < Rails::Railtie
    initializer "rails_template_coverage.compile_with_template_tracking" do |app|
      ActiveSupport.on_load(:action_view) do
        if ENV['RAILS_TEMPLATE_COVERAGE'] && Rails.env.test? && !(ActionView::Template.instance_method(:compile_with_template_tracking!) rescue false)
          ActionView::Template.send(:include, RailsTemplateCoverage)
        end
      end
    end

    rake_tasks { load "tasks/rails_template_coverage.rake" }
  end
end
