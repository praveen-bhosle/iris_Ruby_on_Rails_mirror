class AddMultipleOptionsToFormField < ActiveRecord::Migration[7.2]
  def change
    add_column :form_fields, :multiple_options, :boolean
  end
end
