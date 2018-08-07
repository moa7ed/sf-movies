class ActorsController < ApplicationController
  def search
    @actors = Actor.all.select {|a| a.name.downcase.include? (params[:q]&.downcase || "") }[0..4]
    render json: @actors.map {|a| {"actor": a.name}}.to_a
  end
end
