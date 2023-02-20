# frozen_string_literal: true

class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy
  has_many :uncompleted_items, -> { uncompleted }, class_name: 'TodoItem', dependent: :destroy, inverse_of: :todo_list
  has_many :completed_items, -> { completed }, class_name: 'TodoItem', dependent: :destroy, inverse_of: :todo_list

  validates :name, presence: true

  accepts_nested_attributes_for :todo_items
end
