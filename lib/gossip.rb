# require 'pry'
require 'csv'
class Gossip

    FILE_PATH = File.join(__dir__,"..","db","gossip.csv")
    attr_reader :author, :content
    

    def initialize(author, content)
        @author = author
        @content = content
    end

    def self.init_csv
        if File.exist?(FILE_PATH) || File.size(FILE_PATH) == 0
       CSV.open(FILE_PATH, "w") do |header|
            header << ["author", "content"]
        end
    end
    end

    def save
        CSV.open(FILE_PATH, "a") do |gossip|
         gossip << [@author, @content]
        end
    end
end



# binding.pry

