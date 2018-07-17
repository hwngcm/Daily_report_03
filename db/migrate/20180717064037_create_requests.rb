class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.text :reason
      t.integer :type_request_id
      t.datetime :off_time_start
      t.datetime :off_time_end
      t.datetime :compensation_time_start
      t.datetime :compensation_time_end
      t.integer :status

      t.timestamps
    end
  end
end
