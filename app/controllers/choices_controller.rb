class ChoicesController < ApplicationController
  def new
    @poll = Poll.find(params[:poll_id])
    @choice = Choice.new
  end

  # Méthode pour ajouter un hébergement à un sondage
  def create
    @poll = Poll.find(params[:poll_id])
    if params[:choice][:url].nil?
      Choice.create!(
        user: current_user,
        poll: @poll,
        answer: params[:choice][:answer]
      )

      redirect_to poll_path(@poll)
    else
      url_scrapper
    end
  end

  private

  def url_scrapper
    url = params[:choice][:url]

    puts "----------------------------------------------"
    p params
    p params[:choice][:url]

    if url.present?
      puts "URL reçue : #{url}"

      # Extraire les informations de l'hébergement
      metadata = extract_accommodation_details(url)

      # Affichage des métadonnées extraites pour déboguer
      puts "Titre extrait : #{metadata[:title]}"
      puts "Image extraite : #{metadata[:image]}"
      puts "Description extraite : #{metadata[:description]}"

      puts "Prix extrait : #{metadata[:prix]}"
      puts "metadata : #{metadata}"

      # Créer le choix avec les informations extraites
      choice = Choice.new(
        poll: @poll,
        user: current_user,
        answer: metadata[:title],

        metadata: { url: url, image: metadata[:image], description: metadata[:description], prix: metadata[:prix] }
      )

      if choice.save
        redirect_to poll_path(@poll), notice: "Hébergement ajouté avec succès."
      else
        redirect_to poll_path(@poll), alert: "Impossible d'ajouter cet hébergement."
      end
    else
      redirect_to poll_path(@poll), alert: "Merci de renseigner une URL."
    end
  end

  def extract_accommodation_details(url)
    html = URI.open(url)
    doc = Nokogiri::HTML.parse(html)

    title = begin
      doc.search('.tpy-headline-3')&.first&.text&.strip
    rescue StandardError
      "Titre non disponible"
    end
    image = begin
      doc.search('img.object-cover').first['src']
    rescue StandardError
      "Image non disponible"
    end
    description = begin
      doc.search('.mt-4')&.text&.strip
    rescue StandardError
      "Description non disponible"
    end

    prix = begin
      doc.search('.tpy-headline-5.text-primary-500')&.text&.strip
    rescue StandardError
      "Prix non disponible"
    end

    { title: title, image: image, description: description, prix: prix }
  rescue StandardError => e
    Rails.logger.error("Erreur lors de l'extraction des détails d'hébergement : #{e.message}")
    { title: "Hébergement non disponible", image: nil, description: "Aucune information disponible" }
  end

  def valid_url?(url)
    url.match?(/\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/)
  end

  def choice_params
    params.require(:choice).permit(:answer, :url)
  end
end
