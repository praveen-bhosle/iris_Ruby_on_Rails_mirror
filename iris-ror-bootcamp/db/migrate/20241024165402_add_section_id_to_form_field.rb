class AddSectionIdToFormField < ActiveRecord::Migration[7.2]
  def change
    add_reference :form_fields, :section, null: true , foreign_key: true 
    
    # not working with null as false becuase there are already some records in my formField which dont have section id. 
  end
end
