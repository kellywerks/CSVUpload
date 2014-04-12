class ProductUploadsController < ApplicationController
  def new

  end

  def create
    ProductUpload.new(params[:product_upload][:csv].tempfile).parse!
    redirect_to root_url
  end
end
