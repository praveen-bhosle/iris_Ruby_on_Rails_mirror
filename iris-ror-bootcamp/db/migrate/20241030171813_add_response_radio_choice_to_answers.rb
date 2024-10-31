class AddResponseRadioChoiceToAnswers < ActiveRecord::Migration[7.2]
  def change
    add_column :answers, :response_radio_choice, :string
  end
end
