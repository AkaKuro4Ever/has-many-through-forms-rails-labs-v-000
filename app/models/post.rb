class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments

  def categories_attribute=(category)
    category = Category.find_or_create_by(name: category)
    self.categories << category
  end
end
