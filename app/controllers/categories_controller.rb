class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action except: [:index, :show] { require_admin(categories_path) }
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @category.update(category_params)
      flash[:success] = "Category successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  def show
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
