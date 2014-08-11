class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :hugger_type
      t.text :description

      t.timestamps
    end
  end
end
