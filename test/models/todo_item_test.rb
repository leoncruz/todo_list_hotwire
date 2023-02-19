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
end
