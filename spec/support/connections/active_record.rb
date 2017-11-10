require "rake"

#load File.join(__dir__, '..', '..', '..', 'lib', 'tasks', 'active_record.rake')

if ENV['TRAVIS']
  Rake::Task["db:create"].invoke
#  Rake::Task["db:schema:load"].invoke
  Rake::Task["db:migrate"].invoke
#else
#  Rake::Task["db:environment"].invoke
end

