class AddShelfFieldToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :shelf, :integer
  end
end
