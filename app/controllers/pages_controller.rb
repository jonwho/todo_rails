class PagesController < ApplicationController
  def home
    @todos = Todo.order('RANDOM()').limit(15)
  end
end
