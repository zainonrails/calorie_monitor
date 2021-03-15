class SearchesController < ApplicationController

  def index; end

  def search
    @foods = Food.where('name ILIKE ?', "%#{params[:query]}%")
    respond_to do |format|
      format.js
    end
  end
end
