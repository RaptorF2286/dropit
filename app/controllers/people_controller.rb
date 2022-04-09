class PeopleController < ApplicationController
  before_action :set_person, only: [:show]
  def index
    @people = Person.where.not(id: current_user.id)
  end

  def show; end

  private

  def set_person
    redirect_to dashboard_index_path if params[:id].to_i == current_user.id
    @person = Person.find params[:id].to_i
  end
end
