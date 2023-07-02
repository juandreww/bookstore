class Product < ApplicationRecord
  def name_prefix
    self.name = "Product::#{name}"
  end
end
