class Singleton
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def some_business_logic
    puts 'Any business logic'
  end
end

s1 = Singleton.instance
s2 = Singleton.instance
s2.some_business_logic

if s1.equal?(s2)
  puts 'Singleton works, both variables contain the same instance.'
else
  puts 'Singleton failed, variables contain different instances.'
end
