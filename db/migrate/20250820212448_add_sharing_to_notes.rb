class AddSharingToNotes < ActiveRecord::Migration[8.0]
  def change
    add_column :notes, :public_id, :string
    add_column :notes, :shareable, :boolean, default: false
    
    add_index :notes, :public_id, unique: true
  end
end