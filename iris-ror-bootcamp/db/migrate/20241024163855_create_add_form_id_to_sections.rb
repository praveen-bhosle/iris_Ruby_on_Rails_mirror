class CreateAddFormIdToSections < ActiveRecord::Migration[7.2]
  def change
    create_table :add_form_id_to_sections do |t|
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
