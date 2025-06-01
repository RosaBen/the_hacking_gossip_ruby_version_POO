require_relative 'gossip'
require_relative 'view'

class Controller

    attr_reader :view

    def initialize
        @view = View.new
    end

    def create_gossip

        params = @view.create_gossip
        author = params[:author]
        content = params[:content]
        gossip = Gossip.new(author, content)
        gossip.save
    end
end