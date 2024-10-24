class CreateSections < ActiveRecord::Migration[7.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.string :description
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
