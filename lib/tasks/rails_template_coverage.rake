require 'rake/testtask'

namespace :test do
  task :functionals_and_templates => 'test:functionals' do |t|
    ENV['RAILS_TEMPLATE_COVERAGE'] = 'true'
    tests_start = Time.now
    count = 0
    at_exit {
      puts "\nTemplates not used in functional suite:\n"
      templates = Dir["#{Rails.root.join('app/views')}/**/*"].reject { |t| 
        File.atime(t) > tests_start
      }
      puts "-" * 30
      templates.each { |t| puts "  #{t}" }
      puts "-" * 30
      puts "Total: #{templates.size} templates unused".rjust(30, "-").ljust(60, "-")
    }

    t.libs << "test"
    t.pattern = 'test/functional/**/*.rb'
  end
end