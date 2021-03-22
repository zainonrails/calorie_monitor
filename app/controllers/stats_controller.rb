class StatsController < ApplicationController
  def index
    @graph = ::Stats::Intakes::GraphData.call(params[:start_date], params[:end_date], params[:group_by], current_user.id)
  end
end
