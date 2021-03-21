class BulkFoodsController < ApplicationController
  def new; end

  def create
    byebug
    res = ::Foods::Importer.call(params[:file].path, current_user.id)
    respond_to do |format|
      if res.errors.present?
        format.html { redirect_to foods_url, notice: 'Something went wrong.' }
      else
        format.html { redirect_to foods_url, notice: 'Foods were successfully imported.' }
      end
    end
  end
end