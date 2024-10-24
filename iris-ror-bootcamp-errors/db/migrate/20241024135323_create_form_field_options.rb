class CreateFormFieldOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :form_field_options do |t|
      t.string :option
      t.string :string
      t.references :form_field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
