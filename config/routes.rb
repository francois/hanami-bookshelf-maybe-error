# frozen_string_literal: true

module Bookshelf
  class Routes < Hanami::Routes
    root { "Hello from Hanami" }
    get "/books", to: "books.index"
  end
end
