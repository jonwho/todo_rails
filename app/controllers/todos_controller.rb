class TodosController < ApplicationController
  before_action :set_todo, only: [:update, :destroy]

  def index
    @todo = Todo.new
    @todos = Todo.all
  end

  def create
    @todo = Todo.create!(todo_params)

    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.js
      end
    end
  end

  def destroy
    @todo.destroy unless @todo.nil?
    respond_to do |format|
      format.js
    end
  end

  private

  def set_todo
    @todo = Todo.find_by_id(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def todo_params
    params.require(:todo).permit(:description, :status)
  end
end
