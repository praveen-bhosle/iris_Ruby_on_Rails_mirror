class AddSectionIdToResponse < ActiveRecord::Migration[7.2]
  def change
    add_reference :responses, :section, null: true, foreign_key: true
  end
end
