class StacksController < ApplicationController
  def destroy
    @stack = Stack.find_by(name: params[:name])
    @stack.destroy
    render json: { message: "The stack '#{params[:name]}' and its scrapes have been deleted" }
  end
end
