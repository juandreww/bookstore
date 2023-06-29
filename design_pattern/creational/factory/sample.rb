class Product
end

new_product = Product.new(name: 'Ikan Sarden')
logger(new_product.attributes)
new_product.save