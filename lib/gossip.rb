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

    def self.all
        all_gossips = []
        CSV.foreach(FILE_PATH, headers:true ) do |row|
            author = row["author"]
            content = row["content"]
            gossip = Gossip.new(author, content)
            all_gossips << gossip
        end
        return all_gossips
    end

    def self.find(index)
        all_gossips = Gossip.all
        if index < 0 || index >= all_gossips.length
            return nil
        else
            return all_gossips[index]
        end
    end

    def save
        CSV.open(FILE_PATH, "a") do |gossip|
         gossip << [@author, @content]
        end
    end
end



# binding.pry

