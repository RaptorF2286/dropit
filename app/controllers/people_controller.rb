class PeopleController < ApplicationController
  def index
    @people = Person.where.not(id: current_user.id)
  end

  def show
  end

  private

  def set_person
    @person = Person.find params[:id].to_i
  end
end
