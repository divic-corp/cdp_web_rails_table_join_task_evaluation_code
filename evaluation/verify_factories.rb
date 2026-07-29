require File.join(ENV.fetch("EVALUATION_APP_ROOT"), "config", "environment")
require "factory_bot_rails"

repository_root = File.expand_path("..", __dir__)
FactoryBot.definition_file_paths = [File.join(repository_root, "factories")]
FactoryBot.reload

expected_factories = %i[
  address
  chinese_food
  customer
  food
  italian_food
  japanese_food
  order
  order_food
  shop
]
actual_factories = FactoryBot.factories.map(&:name).sort

unless actual_factories == expected_factories.sort
  abort "Expected factories #{expected_factories.sort.inspect}, got #{actual_factories.inspect}"
end

puts "factory definitions: #{actual_factories.size} loaded"
