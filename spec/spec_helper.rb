require 'unique_by_date'

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => File.join(File.dirname(__FILE__), "test.sqlite3")
)

load File.join(File.dirname(__FILE__), "support", "models.rb")

RSpec.configure do |config|
  config.before do
    load File.join(File.dirname(__FILE__), "support", "schema.rb")
  end
end
