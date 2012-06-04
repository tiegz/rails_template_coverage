require 'rake/testtask'

namespace :test do
Rake::TestTask.new { |t|
  t.libs << "test"
  t.pattern = 'test/**/*_test.rb'
  t.warning = true
}
  Rake::TestTask.new(:functionals_and_templates) do |t|
    ENV['RAILS_TEMPLATE_COVERAGE'] = 'true'
    tests_start = Time.now
    count = 0
    at_exit {
      templates = Dir["#{Rails.root.join('app/views')}/**/*"]
      orig_count = templates.size
      templates.reject! { |t| File.atime(t) > tests_start }
      untested_count = templates.size

      puts "---------------------------------------"
      puts "\nTemplates not used in functional suite:\n"
      puts "---------------------------------------"
      templates.each { |t| puts "  #{t}" }
      puts "---------------------------------------"
      puts " Total: #{untested_count} out of #{orig_count} templates"
      puts "---------------------------------------"
    }

    t.libs << "test"
    t.pattern = 'test/functional/**/*.rb'
  end
end