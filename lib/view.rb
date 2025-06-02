
class View

    def create_gossip
        puts "Entrez le nom de l'auteur: "
        print ">>"
        author = gets.chomp
        puts "Entrez le gossip: "
         print ">>"
         content = gets.chomp
         params = { author: author, content: content }
         return params
    end

    def index_gossips(gossips)
        puts "Voici tous les gossips:"
        gossips.each_with_index do |gossip, index|
            puts "#{index + 1}. #{gossip.author} a dit: '#{gossip.content}'"
        end
    end

    def delete_gossip
        puts "Entrez le numéro du gossip à supprimer:"
        print ">> "
        index = gets.chomp.to_i - 1
        return index
    end
end