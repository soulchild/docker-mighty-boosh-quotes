require 'sinatra/base'

class MightyQuotes < Sinatra::Application
  set :bind, '0.0.0.0'

  class << self
    # class methods
    def quotes
      [
"Howard Moon: I'm an explorer.
Vince Noir: I thought you were a writer?
Howard Moon: I do many things. I span the genres - they call me the genre spanner.
Vince Noir: Yeah, they call you the spanner...",

"The Spirit of Jazz: Ow! My hat's on fire! What's wrong with you? You blind? Why didn't ya tell me?
Howard Moon: Sorry, I thought that was your look",

"Howard Moon: Vince, you've gone wrong.
Vince Noir: I am the Chosen One. I have the amulet.
Howard Moon: Yeah, well maybe it's time I had the amulet for a bit.
Vince Noir: You don't accessorise. There's a simple truth to you.
Howard Moon: Give me the amulet, you bitch!",

"Howard Moon: Just imagine the headlines 'Howard Moon, Colon, Explorer'. Got a ring to that don't it?
Vince Noir: Colon Explorer?
Howard Moon: You know what I'm saying.
Vince Noir: I think that's got the wrong ring to it.",

"Howard Moon: The wind is my only friend.
Wind: [whistling] I hate you.",

"Old Gregg: What do you think of me?
Howard Moon: I don't rightly know, Sir.
Old Gregg: Make an assessment.",
      ]
    end
  end

  before do
      content_type 'text/plain'
  end

  get '/' do
      self.class.quotes.sample
  end

  get '/:id' do
      pass unless params[:id] =~ /^\d+$/
      self.class.quotes[params[:id].to_i] or pass
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end