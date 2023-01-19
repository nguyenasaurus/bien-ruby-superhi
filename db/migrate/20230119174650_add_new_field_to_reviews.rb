class AddNewFieldToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :ambiance, :string
  end
end
