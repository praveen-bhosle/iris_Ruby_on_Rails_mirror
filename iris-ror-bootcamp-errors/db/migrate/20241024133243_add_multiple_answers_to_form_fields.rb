class AddMultipleAnswersToFormFields < ActiveRecord::Migration[7.2]
  def change
    add_column :form_fields, :multiple_answers, :boolean
  end
end
