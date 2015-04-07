class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers, primary_key: :customer_id do |t|
      t.text :first_name 
      t.text :last_name
      t.text :email
      t.integer :age

      t.timestamps
    end
  end
end
