class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans, primary_key: :loan_id do |t|
      t.belongs_to :customer, null: false, index: true
      t.decimal :amount

      t.timestamps
    end
  end
end
