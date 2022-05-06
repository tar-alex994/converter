class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.string :remote_ip, index: true
      t.string :request_id
      t.string :method, index: true
      t.string :query_string, index: true
      t.string :path
      t.string :request_parameters

      t.timestamps
    end
  end
end
