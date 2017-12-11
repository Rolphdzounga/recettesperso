json.extract! commentaire, :id, :commentairetexte, :chef, :recette, :created_at, :updated_at
json.url commentaire_url(commentaire, format: :json)
