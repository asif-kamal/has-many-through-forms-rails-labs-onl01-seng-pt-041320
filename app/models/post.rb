class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  # accepts_nested_attributes_for :categories, reject_if: :reject_categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      
      if category_attribute[:name].present?
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
        # if !self.categories.include?(cat)
        #   self.post_categories.build(:category => cat)
        # end
      end
    end
  end
end

  #  def reject_categories(attributes)
  #   attributes['name'].blank?
  # end
