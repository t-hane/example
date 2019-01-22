class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :member
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
