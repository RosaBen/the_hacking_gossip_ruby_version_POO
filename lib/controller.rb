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

    def index_gossips
        gossips = @view.index_gossips(Gossip.all)
        if gossips.empty?
            puts "Il n'y a pas de gossips à afficher."
        else
            puts "Voici tous les gossips:"
            gossips.each_with_index do |gossip, index|
                puts "#{index + 1}. #{gossip.author} a dit: '#{gossip.content}'"
            end 
        end
    end

    def delete_gossip
        puts "Entrez le numéro du gossip à supprimer:"
        print ">> "
        index = gets.chomp.to_i - 1

        gossips = Gossip.all
        if index < 0 || index >= gossips.length
            puts "Numéro invalide. Aucune suppression effectuée."
        else
            gossips.delete_at(index)
            # Rewriting the CSV file without the deleted gossip
            CSV.open(Gossip::FILE_PATH, "w") do |csv|
                csv << ["author", "content"] # Re-add header
                gossips.each do |gossip|
                    csv << [gossip.author, gossip.content]
                end
            end
            puts "Gossip supprimé avec succès."
        end
    end
end