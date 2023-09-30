class StacksController < ApplicationController
  def destroy
    @stack = Stack.find_by(name: params[:name])
    @stack.destroy
  end
end
