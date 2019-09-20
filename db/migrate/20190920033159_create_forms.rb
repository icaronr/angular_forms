class CreateForms < ActiveRecord::Migration[6.0]
  def change
    create_table :forms do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :primary_color
      t.boolean :enable

      t.timestamps
    end
  end
end
