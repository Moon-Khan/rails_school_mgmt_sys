class CreateTeachers < ActiveRecord::Migration[8.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :contact

      t.timestamps
    end
  end
end
