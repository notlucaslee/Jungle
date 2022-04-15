class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: "jungle", password: "book"

  def show

    @quantity_all = 0
    Product.find_each do |product|
      @quantity_all += product.quantity
    end
    @quantity_all
  end

  @category_all = Category.count

end
