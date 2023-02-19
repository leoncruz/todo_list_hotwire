# frozen_string_literal: true

class TodoItemsController < ApplicationController
  # DELETE /todo_list/:id/todo_items/1 or /todo_list/:id/todo_items/1.json
  def destroy
    todo_item = TodoItem.find(params[:id])
    todo_item.destroy

    respond_to do |format|
      format.html { redirect_to todo_list_path(todo_item.todo_list), notice: t('.notice') }
      format.json { head :no_content }
    end
  end
end
