class BookCategoriesController < ApplicationController
  before_action :filtered_book_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = BookCategory.all.order(ordering: :desc, name: :asc)
  end

  def new
    @category = BookCategory.new
  end

  def create
    @category = BookCategory.new(create_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to book_categories_url(@category), flash: { notice: "Product was successfully created." } }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @category.destroy
  end

  private

  def filtered_book_category
    @category ||= BookCategory.find(params[:id])
  end

  def create_params
    params[:book_category].permit(:name, :ordering)
  end

  def book_category_params

  end
end
