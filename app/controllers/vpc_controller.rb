require 'socket'

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

  respond_to :html, :json
  def show
    port=4000+params[:id].to_i
    puts "log: connect on " + port.to_s
    clientSession = TCPSocket.new( "localhost", port )
    puts "log: starting connection"
    message = "ifInfo"
    clientSession.puts message
    ifInfo=clientSession.gets
    clientSession.close
    puts "log: connection closed"
    ifs=ifInfo.split('|')
    @interfaces = Hash.new
    ifs.each { |s|
      ifn,key,value=s.split('-')
      if key=='MACaddr'
        key='MAC Address'
      elsif key=='IPaddr'
        key='IP Address'
      end
      if not @interfaces[ifn]
        @interfaces[ifn] = {key=>value}
      else
        @interfaces[ifn].merge!(key=>value)
      end
    }
    puts "log: Interface values: " + @interfaces.to_s
  end

end
