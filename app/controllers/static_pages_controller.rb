# frozen_string_literal: true

# Controlador de páginas estáticas
class StaticPagesController < ApplicationController
  def index
    @posts = Post.all
  end
end
