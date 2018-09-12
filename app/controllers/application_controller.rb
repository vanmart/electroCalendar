class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:landing]

  def after_sign_in_path_for(resource)
    if resource.has_role? :MasterAdmin
      rails_admin_path
    elsif resource.has_role? :Admin
      welcome_path
    elsif resource.has_role? :Stylist
      welcome_path
    elsif resource.has_role? :Client
      welcome_path
    elsif resource.has_role? :Visitor
      welcome_path
    else
      root_path
    end
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    
      render :file => "#{Rails.root}/public/access_denied.html", :status => 500, :layout => false
    
  end
  
end
