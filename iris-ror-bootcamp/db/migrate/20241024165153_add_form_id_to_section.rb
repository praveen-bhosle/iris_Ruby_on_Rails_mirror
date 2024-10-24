class AddFormIdToSection < ActiveRecord::Migration[7.2]
  def change
    add_reference :sections, :form, null: false, foreign_key: true
  end
end
