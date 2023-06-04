class PaymentMethodCOD
  def initialize(book)
    @book = book
  end

  def calculate_weekday_sale_amount
    @book.weekday_price
  end

  def calculate_weekend_sale_amount
    @book.weekend_price
  end
end

class PaymentMethodOVO < PaymentMethodCOD
  def calculate_weekday_sale_amount
    @book.weekday_price + platform_fee
  end

  def calculate_weekend_sale_amount
    @book.weekend_price + platform_fee
  end

  private

  def platform_fee
    2_000
  end
end

class PaymentMethodGopay < PaymentMethodCOD
  def calculate_weekday_sale_amount
    @book.weekday_price + platform_fee
  end

  def calculate_weekend_sale_amount
    @book.weekend_price + platform_fee
  end

  private

  def platform_fee
    1_000
  end
end

class Book
  def weekday_price
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}"
  end

  def weekend_price
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}"
  end
end

class ChildrenBook < Book
  def weekday_price
    150_000
  end

  def weekend_price
    180_000
  end
end

class FictionBook < Book
  def weekday_price
    130_000
  end

  def weekend_price
    160_000
  end
end

class HealthBook < Book
end

def weekday_payment_instruction(payment_method)
  puts "Please pay #{payment_method.calculate_weekday_sale_amount} rupiah for this book."
end

def weekend_payment_instruction(payment_method)
  puts "Happy weekend! Please pay #{payment_method.calculate_weekend_sale_amount} rupiah for this book."
end

book = ChildrenBook.new
payment_method = PaymentMethodGopay.new(book)
weekday_payment_instruction(payment_method)

book = FictionBook.new
payment_method = PaymentMethodOVO.new(book)
weekend_payment_instruction(payment_method)

book = Book.new
payment_method = PaymentMethodOVO.new(book)
weekday_payment_instruction(payment_method)