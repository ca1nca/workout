class API::V1::ProgramController < ApplicationController
  def index
    @programs = Program.eager_load(:equipment, :sport).all
    @programs = @programs.filter_by_equipment(params[:equipment]) if params[:equipment]
    @programs = @programs.filter_by_sport(params[:sport]) if params[:sport]
    render json: @programs
  end
end
