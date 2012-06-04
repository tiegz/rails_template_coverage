require 'rake/testtask'

namespace :test do
Rake::TestTask.new { |t|
  t.libs << "test"
  t.pattern = 'test/**/*_test.rb'
  t.warning = true
}
  Rake::TestTask.new(:functionals_and_templates) do |t|
    ENV['RAILS_TEMPLATE_COVERAGE'] = 'true'
    File.open("#{Rails.root}/tmp/TEST_START_TIME", "w") { |f| f.write(Time.now.to_i) }
    count = 0
    at_exit {
      templates = Dir["#{Rails.root.join('app/views')}/**/*"]
      orig_count = templates.size
      test_start_time = Time.at File.open("#{Rails.root}/tmp/TEST_START_TIME", "r").read.to_i
      templates.reject! { |t|
        puts "#{t}? #{File.atime(t)} > #{test_start_time}: #{File.atime(t) > test_start_time}"
        File.atime(t) > test_start_time 
      }
      untested_count = templates.size

      puts "---------------------------------------"
      puts "\nTemplates not used in functional suite:\n"
      puts "---------------------------------------"
      templates.each { |t| puts "  #{t}" }
      puts "---------------------------------------"
      puts " Total: #{untested_count} out of #{orig_count} templates"
      puts "---------------------------------------"
      File.delete("#{Rails.root.join}/tmp/TEST_START_TIME")
    }

    t.libs << "test"
    t.pattern = 'test/functional/**/*.rb'
  end
end