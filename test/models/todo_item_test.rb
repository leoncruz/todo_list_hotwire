# frozen_string_literal: true

require 'test_helper'

class TodoItemTest < ActiveSupport::TestCase
  test 'invalid todo item' do
    todo_list = todo_lists(:one)

    todo_item = TodoItem.new(todo_list: todo_list)

    assert_not todo_item.valid?
  end

  test 'valid todo item' do
    todo_list = todo_lists(:one)

    todo_item = TodoItem.new(todo_list: todo_list, name: 'Name')

    assert_predicate todo_item, :valid?
  end

  test 'should return only TodoItems marked as completed' do
    completed = TodoItem.create(completed: true, name: 'Completed Todo', todo_list: todo_lists(:one))
    TodoItem.create(completed: false, name: 'Uncompleted Todo', todo_list: todo_lists(:one))

    assert_equal TodoItem.completed, [completed]
  end

  test 'should return only uncompleted TodoItems' do
    TodoItem.create(completed: true, name: 'Completed Todo', todo_list: todo_lists(:one))
    uncompleted_one = todo_items(:one)
    uncompleted_two = todo_items(:two)

    assert_equal TodoItem.uncompleted, [uncompleted_one, uncompleted_two]
  end
end
