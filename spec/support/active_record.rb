require 'active_record'
require 'aktibibo'

ActiveRecord::Base.establish_connection adapter: "mysql2", database: "test"

class Foo < ActiveRecord::Base
  activatable
end

def clean_database
  models = [Foo]
  models.each do |model|
    ActiveRecord::Base.connection.execute "TRUNCATE TABLE #{model.table_name}"
  end
end