class Api::V1::Customers::FindController < ApplicationController
  def index
    @customers = Customer.where(find_customer_params)
    render 'api/v1/customers/index'
  end

  def show
    @customer = Customer.find_by(find_customer_params)
    render 'api/v1/customers/show'
  end

  private
    def find_customer_params
      params.permit(:id, :last_name, :first_name, :created_at, :updated_at)
    end
end
