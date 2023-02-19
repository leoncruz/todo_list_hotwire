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

  test 'should not create a todo list without a todo item' do
    visit todo_lists_url
    click_on 'New todo list'

    within '#todo-list-form' do
      fill_in 'Name', with: @todo_list.name
    end
    click_on 'Create Todo list'

    assert_text I18n.t('activerecord.errors.messages.blank')
    click_on 'Back'
  end

  test 'should create todo list with todo items' do
    visit todo_lists_path
    click_on 'New todo list'

    within '#todo-list-form' do
      fill_in 'Name', with: 'New Todo List'
    end

    within '#todo-item-form' do
      fill_in 'Name', with: 'New Todo List Item'
    end

    click_on 'Create Todo list'

    assert_text 'Todo list was successfully created'

    assert_text 'New Todo List'
    assert_text 'New Todo List Item'
  end

  test 'should not update a Todo list without todo item' do
    visit todo_list_url(@todo_list)
    click_on 'Edit this todo list', match: :first

    within '#todo-list-form' do
      fill_in 'Name', with: 'New name'
    end

    click_on 'Update Todo list'

    assert_text I18n.t('activerecord.errors.messages.blank')

    click_on 'Back'
  end

  test 'should update todo list and todo items' do
    visit todo_list_url(@todo_list)

    click_on 'Edit this todo list', match: :first

    within '#todo-list-form' do
      fill_in 'Name', with: 'New name'
    end

    within '#todo-item-form' do
      fill_in 'Name', with: 'New Item'
    end

    click_on 'Update Todo list'

    assert_text I18n.t('todo_lists.update.notice')
  end

  test 'should destroy Todo list' do
    visit todo_list_url(@todo_list)
    click_on 'Destroy this todo list', match: :first

    assert_text 'Todo list was successfully destroyed'
  end

  test 'should delete a todo item' do
    visit todo_list_url(@todo_list)

    assert_text 'Todo Item 1'

    accept_alert I18n.t('todo_lists.todo_list.delete_todo_item_confirm') do
      click_on 'Remove item'
    end

    refute_text 'Todo Item 1'
  end
end
