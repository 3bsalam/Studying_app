class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.belongs_to :user
      t.belongs_to :list
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
