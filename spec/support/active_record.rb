ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "spec/test.db")

class ExampleRecord < ActiveRecord::Base
end

RSpec.configure do |config|
  config.around do |example|
    ActiveRecord::Base.transaction do
      ActiveRecord::Migration.verbose = false
      ActiveRecord::Migration.create_table(:example_records) do |table|
        table.integer :user_id
        table.integer :example_count
        table.timestamps
      end

      example.run

      ExampleRecord.instance_variable_set(:@assorted_options, nil)
      Assorted.instance_variable_set(:@options, nil)

      raise ActiveRecord::Rollback
    end
  end

  config.after(:suite) do
    ActiveRecord::Base.connection.instance_variable_get("@config").tap do |configuration|
      File.delete(configuration[:database])
    end
  end
end
