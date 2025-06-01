
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
end