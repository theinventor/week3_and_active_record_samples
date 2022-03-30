class AddSecretNoteToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :secret_note, :text
  end
end
