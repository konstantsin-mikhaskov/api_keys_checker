class KeysController < ApplicationController
  def index
    @per_page = 25
    params[:page] ? @page = params[:page] : @page = 1
    @keys = Key.paginate(page: @page, per_page: @per_page)
  end

  def check_availability
    @key = Key.find params[:id]
    request_url = helpers.form_check_query(@key)
    helpers.execute_check_query(request_url)
  end

  def key_params
    params.require(:key)#.permit(:, :address)
  end
end
