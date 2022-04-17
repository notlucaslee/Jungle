class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: "jungle", password: "book"

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(
      :name
    ))

    if @category.save
      redirect_to [:admin, :categories], notice: 'Product created!'
    else
      render :new
    end
  end

end
