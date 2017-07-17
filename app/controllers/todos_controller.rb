class TodosController < ApplicationController
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
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo = Todo.find_by_id(params[:id])
    @todo.destroy unless @todo.nil?
    respond_to do |format|
      format.js
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def todo_params
    params.require(:todo).permit(:description)
  end
end
