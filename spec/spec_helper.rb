$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'aktibibo'
require 'support/active_record'

RSpec.configure do |config|

  config.before(:suite) do
    ActiveRecord::Migration.create_table(:foos, force: true) do |t|
      t.string :name
      t.datetime :activated_at
      t.datetime :deactivated_at
      t.timestamps
    end
  end

  config.after(:suite) do
    models = [Foo]
    models.each do |model|
      ActiveRecord::Base.connection.execute "DROP TABLE #{model.table_name}"
    end
  end
end
