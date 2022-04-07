# frozen_string_literal: true

# Controlador de dashboard
class DashboardController < ApplicationController
  before_action :authenticate_user!
end
