class TodosController < ApplicationController
  before_action :ensure_user
  before_action :set_todo, only: [:update, :destroy]

  def index
    @todo  = Todo.new
    @todos = Todo.not_deleted.where('user_id = ?', current_user.id).order(:created_at)
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
    @todo.soft_delete unless @todo.nil?
    respond_to do |format|
      format.js
    end
  end

  private

  def ensure_user
    redirect_to root_path, flash: { danger: 'You must be signed in first!' } if current_user.blank?
  end

  def set_todo
    @todo = Todo.find_by_id(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def todo_params
    params
      .require(:todo)
      .permit(:description, :status)
      .merge(user_id: current_user.id)
  end
end
