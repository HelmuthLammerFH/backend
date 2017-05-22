class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.string :address
      t.string :city
      t.string :email
      t.string :username
      t.string :passwort
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom

      t.timestamps
    end
  end
end
