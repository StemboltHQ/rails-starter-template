namespace :assets do
  task :precompile => :webpack
end

task :webpack do
  sh "npm run compile"
end
