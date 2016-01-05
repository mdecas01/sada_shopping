class CategoriesController < ApplicationController

  before_action :request_signin_first
  before_action :allow_admin_user

  def index
    @category_level1 = Category.where(level: 1)
    @category_level2 = Category.where(level: 2)
    @category_level3 = Category.where(level: 3)
  end	

  def new
    @category = Category.new
  end	

  def create
    @category = Category.new(category_params)
    if params[:parent]
      @category.parent = Category.find_by(name: params[:parent]).id 
    end  
    if @category.save
      redirect_to categories_url, notice: "The new category was added!"
    else
      render :new
    end    
  end	

  def destroy
    @category = Category.find(params[:id])
    @category.delete
    flash[:alert] = "Category successfully deleted!"
    redirect_to categories_url
  end	

  def category_params
      params.require(:category).permit(:name, :level, :parent)
   end
end
