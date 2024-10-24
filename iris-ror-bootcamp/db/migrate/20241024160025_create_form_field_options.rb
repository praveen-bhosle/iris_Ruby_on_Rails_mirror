class CreateFormFieldOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :form_field_options do |t|
      t.references :form_field, null: false, foreign_key: true
      t.text :option

      t.timestamps
    end
  end
end
