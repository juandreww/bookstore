class Product::Models::Food < ::Product

  validate :name_has_prefix

  def name_prefix
    self.name = "FoodModel::#{name}"
  end

  def name_has_prefix
    if self.name.exclude?('FoodModelz')
      raise Error
    end
  end
end