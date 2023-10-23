class ChangeOptionCustomeridBodyToPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :customer_id, false, ""
    change_column_default :posts, :customer_id, from: nil, to: ""
  end
end
