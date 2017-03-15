class AddPaymentCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :payments_count, :integer
  end
end
