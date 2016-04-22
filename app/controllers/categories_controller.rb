class CategoriesController < ApplicationController


  def index
    @category_level1 = Category.where(level: 1)
    @category_level2 = Category.where(level: 2)
    @category_level3 = Category.where(level: 3)
    @categories = Category.all
  end	

  def new
    @category = Category.new
  end	

  def create
    @category = Category.new(category_params)
    #if params[:parent]
      #@category.parent = Category.find_by(name: params[:parent]) 
    #end  
    if @category.save
      redirect_to categories_url, notice: "The new category was added!"
    else
      render :new
    end    
  end	

  def destroy
    destroy_category_and_children(params[:id])
    flash[:alert] = "Category successfully deleted!"
    redirect_to categories_url
  end	

  def category_params
      params.require(:category).permit(:name, :level, :parent)
   end

   def find_parent_name(parent)
     Category.find(parent.to_i)
   end 

   helper_method :find_parent_name
   
   #returns the category in level 2 that is parent of the given category
   def find_second_parent(categoryl3) 
     Category.find(categoryl3.parent)
   end

   helper_method :find_first_parent
   
   #returns the category in the top level that is parent of the parent of the given category
   def find_first_parent(categoryl3)
     Category.find(Category.find(categoryl3.parent))
   end 

   helper_method :find_second_parent

   def destroy_category_and_children(category_id)
    child_1 = Category.find_by(parent: category_id)
    child_2 = Category.find_by(parent: Category.find_by(parent: category_id))
    @category = Category.find(category_id)
    child_2.delete unless child_2.nil?
    child_1.delete unless child_1.nil?
    @category.delete
  end
end

