class VpcController < ApplicationController
  def index
  end

  def new
  end

  respond_to :html, :json
  def create
    # kode der danner JSON
    # @test = params[:command]
    respond_with params 
    # puts @test[:command]
    # render json: params
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  def show
    respond_with params 
  end

end
