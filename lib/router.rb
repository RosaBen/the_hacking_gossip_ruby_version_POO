require_relative 'controller'


class Router

    def initialize
        @controller = Controller.new 
    end

    def perform
        puts "Bienvenue dans Gossip project"

        while true
            puts "Tu veux faire quoi jeune mouss?"
            puts "1\. Je veux créer un gossip"
            puts "2\. Afficher tous les potins"
            puts "3\. Je veux supprimer un gossip"
            puts "4\. Je veux quitter app"
            params = gets.chomp.to_i

            case params
            when 1
                puts "tu as choisi de créer un gossip"
                @controller.create_gossip
                
            when 2
                puts "Tu veux voir tous les gossips"
                @controller.index_gossips

            when 3
                puts "Tu veux supprimer un gossip"
                @controller.delete_gossip

            when 4
                puts "a bientot"
                break

            else
                puts "Ce choix n'existe pas, réessaye"
            end
        end

    end

end
