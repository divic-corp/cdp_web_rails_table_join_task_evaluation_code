require "rake"

desc "Run the evaluation compatibility verification"
task spec: "evaluation:verify"

task default: "evaluation:verify"

namespace :evaluation do
  desc "Verify Rails compatibility and unimplemented-result detection"
  task :verify do
    ruby "scripts/verify_evaluation"
  end
end
