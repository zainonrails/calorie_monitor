class SearchesController < ApplicationController
  skip_before_action :authenticate_user! # skip authentication for searching

  def index; end

  def search
    @foods = Food.where('name ILIKE ?', "%#{params[:query]}%").where(is_default: true)
    @user_foods = if user_signed_in?
                    Food.where('name ILIKE ?', "%#{params[:query]}%").where(is_default: false, user_id: current_user.id)
                  end
    respond_to do |format|
      format.js
    end
  end

  def food_dropdown_search
    @foods = Food.select('id', 'name AS text')
  end
end
