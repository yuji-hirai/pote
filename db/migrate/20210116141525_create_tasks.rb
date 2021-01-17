class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.string :all_day
      t.text :content

      t.timestamps
    end
  end
end
