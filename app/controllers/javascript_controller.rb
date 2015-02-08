require 'uglifier'

class JavascriptController < ApplicationController
  layout 'application'
  skip_before_filter :verify_authenticity_token

  def index
  end

  def create
    begin
      @output = Uglifier.compile(params[:javascript])
    rescue Exception => e
      @output = params[:javascript]
      @error = "There was a problem compiling your javascript code"
    end
    render :index
  end
end
