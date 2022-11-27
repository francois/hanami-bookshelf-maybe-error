# frozen_string_literal: true
require "byebug"

module Bookshelf
  module Actions
    module Books
      class Index < Bookshelf::Action
        params do
          optional(:page).value(:integer, gt?: 0, lteq?: 100)
          optional(:per_page).value(:integer, gt?: 0, lteq?: 100)
        end

        def handle(request, response)
          response.header["Content-Type"] = "application/json"
          response.body = JSON.pretty_generate(
            valid: request.params.valid?,
            errors: request.params.errors,
            page: {
              value: request.params[:page],
              klass: request.params[:page].class.name
            },
            per_page: {
              value: request.params[:per_page],
              klass: request.params[:per_page].class.name
            }
          )
        end
      end
    end
  end
end
