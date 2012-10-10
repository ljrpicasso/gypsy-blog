class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_sidebar

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private
  def load_sidebar
    recipe_dir = "/public/recipes"
    @recipes = Dir.glob("#{Rails.root}#{recipe_dir}/*.pdf");
    @recipes_names = @recipes.map {|n| File.basename(n,".pdf") }
    @recipes_urls = @recipes.map { |p| "/recipes/#{URI.encode(File.basename(p))}" }
    @recipes = @recipes_names.zip @recipes_urls
  end
end
