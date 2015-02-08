require 'uglifier'

class JavascriptController < ApplicationController
  layout 'application'
  skip_before_filter :verify_authenticity_token

  def index
  end

  def create
    @output = Uglifier.compile(params[:javascript])
    render :index
  end
end
