class BookCategoriesController < ApplicationController
  def index
    @categories = BookCategory.all
  end

  def new
    @category = BookCategory.new
  end

  def create
    @category = BookCategory.new(create_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to book_categories_url(@category), flash: { notice: "Product was successfully created." } }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
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
  end

  private

  def create_params
    params[:book_category].permit(:name, :ordering)
  end
end
