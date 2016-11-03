class Graphql::QueryController < ApplicationController
  def queries
    context         = {page_size: page_size}
    query_string    = params[:query]
    query_variables = params[:variables] || {}

    result = CoffeeBeanSchema.execute query_string, variables: query_variables, context: context

    render json: result
  end

  protected

  def page_size
    5
  end
end
