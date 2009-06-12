class Admin::Disguise::DomainThemesController < ApplicationController
  unloadable

  def create
    @domain_theme = DomainTheme.new(params[:domain_theme])
    if !@domain_theme.save
      flash[:notice] = t('disguise.error_creating_domain_theme', :error => @domain_theme.errors.full_messages.to_sentence)
    else
      flash[:notice] = t('disguise.theme_updated')
    end
    respond_to do |format|
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

  def destroy
    @domain_theme = DomainTheme.find(params[:id])
    @domain_theme.destroy
    respond_to do |format|
      flash[:notice] = t('disguise.uri_deleted')
      format.html { redirect_to edit_admin_theme_path }
    end
  end
  
end