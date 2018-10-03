class Api::TodosController < ApplicationController

  def create
    @todo = Todo.new(todoparams)

    if @todo.save!
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def show
    render json: Todo.find(params[:id])
  end

  def index
    @todos = Todo.all
    render json: @todos
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todoparams)
      render json: @todo
    else
      render json: @todo.error.full_messages, status: 422
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end

  private

  def todoparams
    params.require(:todo).permit(:title, :body, :done)
  end



end
