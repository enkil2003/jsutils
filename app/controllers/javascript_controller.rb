require 'uglifier'

class JavascriptController < ApplicationController
  layout 'application'
  skip_before_filter :verify_authenticity_token
  before_filter :set_theme

  def index
  end

  def create
    begin
      @output = Uglifier.compile(params[:javascript])
      @compress_ratio = (@output.length.to_f / params[:javascript].length.to_f * 100).to_i
    rescue Exception => e
      @output = params[:javascript]
      @error = "There was a problem compiling your javascript code"
    end
    render :index
  end

  private

  def set_theme
    @theme = 'eclipse'
  end
end
