# frozen_string_literal: true

require 'application_system_test_case'

class TodoListsTest < ApplicationSystemTestCase
  setup do
    @todo_list = todo_lists(:one)
  end

  test 'visiting the index' do
    visit todo_lists_url

    assert_selector 'h1', text: 'Todo lists'
  end

  test 'should create todo list' do
    visit todo_lists_url
    click_on 'New todo list'

    within '#todo-list-form' do
      fill_in 'Name', with: @todo_list.name
    end
    click_on 'Create Todo list'

    assert_text 'Todo list was successfully created'
    click_on 'Back'
  end

  test 'should update Todo list' do
    visit todo_list_url(@todo_list)
    click_on 'Edit this todo list', match: :first

    within '#todo-list-form' do
      fill_in 'Name', with: 'New name'
    end

    click_on 'Update Todo list'

    assert_text 'Todo list was successfully updated'
    assert_text 'New name'

    click_on 'Back'
  end

  test 'should destroy Todo list' do
    visit todo_list_url(@todo_list)
    click_on 'Destroy this todo list', match: :first

    assert_text 'Todo list was successfully destroyed'
  end
end
