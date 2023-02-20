# frozen_string_literal: true

require 'application_system_test_case'

class TodoListsTest < ApplicationSystemTestCase
  setup do
    @todo_list = todo_lists(:one)
  end

  test 'visiting the index' do
    visit todo_lists_url

    assert_selector 'h1', text: I18n.t('todo_lists.index.title')
  end

  test 'should not create a todo list without a todo item' do
    visit todo_lists_url
    click_on I18n.t('helpers.actions.new', model: TodoList.model_name.human)

    within '#todo-list-form' do
      fill_in 'Name', with: @todo_list.name
    end
    click_on I18n.t('helpers.submit.create', model: TodoList.model_name.human)

    assert_text I18n.t('activerecord.errors.messages.blank')
    click_on 'Back'
  end

  test 'should create todo list with todo items' do
    visit todo_lists_path
    click_on I18n.t('helpers.actions.new', model: TodoList.model_name.human)

    within '#todo-list-form' do
      fill_in 'Name', with: 'New Todo List'
    end

    within '#todo-item-form' do
      fill_in 'Name', with: 'New Todo List Item'
    end

    click_on I18n.t('helpers.submit.create', model: TodoList.model_name.human)

    assert_text 'Todo list was successfully created'

    assert_text 'New Todo List'
    assert_text 'New Todo List Item'
  end

  test 'should update todo list and todo items' do
    visit todo_list_url(@todo_list)

    click_on I18n.t('helpers.actions.edit', model: TodoList.model_name.human.pluralize)

    within '#todo-list-form' do
      fill_in 'Name', with: 'New name'
    end

    within '#todo-item-form' do
      fill_in 'Name', with: 'New Item'
    end

    click_on I18n.t('helpers.submit.update', model: TodoList.model_name.human)

    assert_text I18n.t('todo_lists.update.notice')
  end

  test 'should destroy Todo list' do
    visit edit_todo_list_path(@todo_list)

    accept_alert I18n.t('helpers.actions.confirm') do
      click_on I18n.t('helpers.actions.destroy', model: TodoList.model_name.human)
    end

    assert_text 'Todo list was successfully destroyed'
  end

  test 'should delete a todo item' do
    visit todo_list_url(@todo_list)

    assert_text 'Todo Item 1'

    accept_alert I18n.t('helpers.actions.confirm') do
      click_link href: todo_list_todo_item_path(@todo_list, @todo_list.todo_items.first)
    end

    refute_text 'Todo Item 1'
  end
end
