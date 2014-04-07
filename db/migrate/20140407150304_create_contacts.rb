class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :from
      t.string :message

      t.timestamps
    end
    add_index :contacts, :name
    add_index :contacts, :from
  end
end
