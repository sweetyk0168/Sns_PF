class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Customer"
  belongs_to :followerd, class_name: "Customer"

  #フォローしたときの処理
  def follow(customer_id)
    followers.create(followed_id: customer_id)
  end

  #フォローを外すときの処理
  def unfollow(customer_id)
    followers.find_by(followed_id: customer_id).destroy
  end

  #フォローしていればtrueを返す
  def following?(customer)
    following_customers.include?(customer)
  end
end
