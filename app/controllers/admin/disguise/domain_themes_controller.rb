class Admin::Disguise::DomainThemesController < ApplicationController
  unloadable

  def create
    @domain_theme = DomainTheme.create(params[:domain_theme])
    respond_to do |format|
      flash[:notice] = t('disguise.theme_updated')
      format.html { redirect_to edit_admin_theme_path }
    end
  end
  
  def update
    @domain_theme = DomainTheme.find_by_name(params[:domain_theme][:name])
    @domain_theme.update_attributes!(params[:domain_theme])
    respond_to do |format|
      flash[:notice] = t('disguise.theme_updated')
      format.html { redirect_to edit_admin_theme_path }
    end
  end

end