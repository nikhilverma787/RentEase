class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|

      t.timestamps
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :mobile
      t.boolean :super_admin
      t.boolean :terms
    end
  end
end