ENV['RACK_ENV'] = 'test'

require File.expand_path '../helper.rb', __FILE__

# Monkey-patch quotes
class MightyQuotes
  class << self
    def quotes 
      ["first quote", "second quote"]
    end
  end
end

class MightyQuotesTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    MightyQuotes
  end

  def test_it_returns_a_random_quote
    get '/'
    assert last_response.ok?
    assert_includes app.quotes, last_response.body
  end
  
  def test_it_returns_a_specific_quote
    get '/0'
    assert last_response.ok?
    assert_equal 'first quote', last_response.body
  end
end