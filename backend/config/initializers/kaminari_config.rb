# frozen_string_literal: true

Kaminari.configure do |config|
  # NOTE: default_per_pageを指定すると、controllerでperを指定しなくても指定した件数になる。今回は10件
  config.default_per_page = 10
  # config.max_per_page = nil
  # config.window = 4
  # config.outer_window = 0
  # config.left = 0
  # config.right = 0
  # config.page_method_name = :page
  # config.param_name = :page
  # config.max_pages = nil
  # config.params_on_first_page = false
end
