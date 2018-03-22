class PagesController < ApplicationController
  def home
    redirect_to todos_path if logged_in?

    @todos = Todo.order('RANDOM()').limit(15)
  end
end
