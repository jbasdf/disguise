class Admin::Disguise::ThemesController < ApplicationController
  unloadable

  before_filter :get_theme

  def edit
    @current_theme, @themes = Theme.available_themes(@theme)
    @domain_themes = {}
    DomainTheme.all.each{ |d| @domain_themes[d.name] = @domain_themes[d.name].blank? ? [d] : @domain_themes[d.name] << d }
    if @themes.empty?
      respond_to do |format|
        format.html { render :template => 'admin/themes/no_themes' }
      end
    else
      respond_to do |format|
        format.html { render :template => 'admin/themes/edit' }
      end
    end
  end

  def update
    @theme.update_attributes!(params[:theme])
    respond_to do |format|
      if @theme.name.blank?
        flash[:notice] = t('disguise.theme_removed')
      else
        flash[:notice] = t('disguise.theme_updated')
      end
      format.html { redirect_to edit_admin_theme_path }
    end
  end

  private
    def get_theme
      @theme = Theme.first || Theme.create
    end

end