# frozen_string_literal: true

require 'test_helper'

class TodoListTest < ActiveSupport::TestCase
  test 'valid todo list' do
    todo_list = TodoList.new name: 'Todo List #1'

    assert_predicate(todo_list, :valid?)
  end

  test 'invalid todo list' do
    todo_list = TodoList.new

    assert_not todo_list.valid?
  end
end
