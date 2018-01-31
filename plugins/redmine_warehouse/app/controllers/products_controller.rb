class ProductsController < ApplicationController
  unloadable

  def index
    @project = Project.find_by_name(params[:id])
    @products = Product.all
  end

  def new
    @issue = Issue.find(params[:issue_id])
    @product = Product.new
  end

  def create
    @issue = Issue.find(params[:issue_id])
    @product = Product.new(product_params)
    @product.issue_id = params[:issue_id]

    if @product.save
      respond_to do |format|
        format.html {
          flash[:notice] = l(:notice_successful_create)
          redirect_to products_path(@product)
        }
      end
    else
      respond_to do |format|
        format.html {render :action => 'new'}
        format.api {render_validation_errors(@product)}
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end


  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      respond_to do |format|
        flash[:notice] = l(:notice_successful_create)
        format.html { redirect_to products_path(@product) }
      end
      else

          format.html {render :action => 'edit'}
          format.api {render_validation_errors(@product)}

      end


  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :cost, :quantity, :date_production, :issue_id)
  end

end
