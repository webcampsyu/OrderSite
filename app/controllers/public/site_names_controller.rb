class Public::SiteNamesController < ApplicationController
  
  def index
    @site_name = SiteName.new
    @site_names = current_customer.site_names
  end 
  
  def edit
    @site_name = SiteName.find(params[:id])
  end 
  
  def create
    @site_name = SiteName.new(site_name_params)
    if @site_name.save
      flash[:notice] = "現場名を登録しました"
      redirect_to site_names_path
    else 
      flash[:alert] = "現場名の登録に失敗しました"
      @new_site_name = SiteName.new
      @site_names = SiteName.all
      render :index
    end 
  end 
  
  def update
    @site_name = SiteName.find(params[:id])
    if @site_name.update(site_name_params)
      flash[:notice] = "編集に成功しました"
      redirect_to site_names_path
    else 
      flash[:alert] = "編集に失敗しました"
      render :edit
    end 
  end 
  
  private
  def site_name_params
    params.require(:site_name).permit(:name, :customer_id, :address)
  end 
  
    
  
end
