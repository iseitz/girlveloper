class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.string :youtube
      t.string :links
      t.integer :views, default: 0
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
