class AddResponseCheckboxChoicesToAnswers < ActiveRecord::Migration[7.2]
  def change
    add_column :answers, :response_checkbox_choices, :string 
  end
end
