class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :desc
      t.date :start
      t.date :end

      t.timestamps null: false
    end
  end
end
