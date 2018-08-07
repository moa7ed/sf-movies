Rails.application.routes.draw do

  get 'locations/index'
  get 'locations/search'
  get 'movies/search'
  get 'movies/search_for_directors'
  get 'movies/search_for_writers'
  get 'actors/search'

  root 'locations#index'

end
