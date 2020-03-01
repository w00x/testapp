class TodoItemController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    @todo_items = TodoItem.all
    json_response @todo_items
  end

  def create
    begin
      @todo_item = TodoItem.create! todo_item_params
      json_response @todo_item, :created
    rescue => ex
      json_response({error: ex.message}, :unprocessable_entity)
    end
  end

  def show
    json_response @todo_item
  end

  def update
    begin
      @todo_item.update!(todo_item_params)
      head :no_content
    rescue => ex
      json_response({error: ex.message}, :unprocessable_entity)
    end
  end

  def destroy
    begin
      @todo_item.destroy!
      head :no_content
    rescue => ex
      json_response({error: ex.message}, :unprocessable_entity)
    end
  end

  private

  def todo_item_params
    params.permit(:descripcion, :hecho, :todo_id)
  end

  def set_todo
    begin
      @todo_item = TodoItem.find(params[:id])
    rescue => ex
      json_response({error: ex.message}, :not_found)
    end
  end
end
