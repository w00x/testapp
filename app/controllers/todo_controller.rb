include Response

class TodoController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    @todos = Todo.all
    json_response @todos
  end

  def create
    begin
      @todo = Todo.create! todo_params
      json_response @todo, :created
    rescue => ex
      json_response({error: ex.message}, :unprocessable_entity)
    end
  end

  def show
    json_response @todo
  end

  def update
    begin
      @todo.update!(todo_params)
      head :no_content
    rescue => ex
      json_response({error: ex.message}, :unprocessable_entity)
    end
  end

  def destroy
    begin
      @todo.destroy!
      head :no_content
    rescue => ex
      json_response({error: ex.message}, :unprocessable_entity)
    end
  end

  private

  def todo_params
    params.permit(:titulo)
  end

  def set_todo
    begin
      @todo = Todo.find(params[:id])
    rescue => ex
      json_response({error: ex.message}, :not_found)
    end
  end
end
