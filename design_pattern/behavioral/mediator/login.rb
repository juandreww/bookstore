# Mediator class
class LoginMediator
  def initialize(username_input, password_input, login_button)
    @username_input = username_input
    @password_input = password_input
    @login_button = login_button
  end

  def setup
    @login_button.on_click { authenticate }
  end

  def authenticate
    username = @username_input.value
    password = @password_input.value

    # Perform authentication logic here
    if username == "admin" && password == "password"
      puts "Login successful!"
    else
      puts "Invalid credentials!"
    end
  end
end

# GUI components
class TextInput
  attr_accessor :value

  def initialize
    @value = ""
  end
end

class Button
  def on_click(&block)
    @click_handler = block
  end

  def click
    puts @click_handler
    @click_handler.call if @click_handler
  end
end

# Usage
username_input = TextInput.new
password_input = TextInput.new
login_button = Button.new

mediator = LoginMediator.new(username_input, password_input, login_button)
mediator.setup

# Simulating user interaction
username_input.value = "admin"
password_input.value = "password"
login_button.click
