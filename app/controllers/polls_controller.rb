require "nokogiri"
require "open-uri"

class PollsController < ApplicationController

  def create
    @poll = Poll.new(poll_params)
    @poll.group = Group.find(params[:group_id])

    if @poll.save
      redirect_to group_path(@poll.group), notice: 'Sondage créé avec succès.'
    else
      render :new, alert: 'Impossible de créer le sondage.'
    end
  end

  def show
    @poll = Poll.find(params[:id])
    @choice = Choice.new
  end

  # Méthode pour ajouter un hébergement à un sondage
  def create_accommodation_choice
    poll = Poll.find(params[:id])
    url = params[:url]

    if url.present?
      puts "URL reçue : #{url}"

      # Extraire les informations de l'hébergement
      metadata = extract_accommodation_details(url)

      # Affichage des métadonnées extraites pour déboguer
      puts "Titre extrait : #{metadata[:title]}"
      puts "Image extraite : #{metadata[:image]}"
      puts "Description extraite : #{metadata[:description]}"

      # Créer le choix avec les informations extraites
      choice = Choice.new(
        poll: poll,
        user: current_user,
        answer: metadata[:title],
        metadata: { url: url, image: metadata[:image], description: metadata[:description] }
      )

      if choice.save
        redirect_to poll_path(poll), notice: "Hébergement ajouté avec succès."
      else
        redirect_to poll_path(poll), alert: "Impossible d'ajouter cet hébergement."
      end
    else
      redirect_to poll_path(poll), alert: "Merci de renseigner une URL."
    end
  end

  private
  
  def extract_accommodation_details(url)
    html = URI.open(url)
    doc = Nokogiri::HTML.parse(html)

    title = doc.search('.tpy-headline-3')&.text.strip rescue "Titre non disponible"
    image = doc.search('img.object-cover').first['src'] rescue "Image non disponible"
    description = doc.search('.mt-4')&.text.strip rescue "Description non disponible"

    { title: title, image: image, description: description }
  rescue StandardError => e
    Rails.logger.error("Erreur lors de l'extraction des détails d'hébergement : #{e.message}")
    { title: "Hébergement non disponible", image: nil, description: "Aucune information disponible" }
  end

  def valid_url?(url)
    url.match?(/\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/)
  end

  # Filtrage des paramètres du sondage
  def poll_params
    params.require(:poll).permit(:title, :category, :state, :group_id)
  end
end
