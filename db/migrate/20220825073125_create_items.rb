class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price

      t.timestamps
    end
  end
end
