class AddColumnToMember < ActiveRecord::Migration[5.2]
  def change
    change_table :members do |t|
      t.string :comment
    end
  end
end
