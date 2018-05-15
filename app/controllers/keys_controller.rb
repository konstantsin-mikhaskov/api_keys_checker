class KeysController < ApplicationController
  def index
    @per_page = 25
    params[:page] ? @page = params[:page] : @page = 1
    @keys = Key.paginate(page: @page, per_page: @per_page)
  end

  def check_availability
    binding.pry
    @key = Key.find params[:id]
    helpers.amazon_ckeck_query(@key)
    redirect_to root_path
  end

  def key_params
    params.require(:key)#.permit(:, :address)
  end
end
