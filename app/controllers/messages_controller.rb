require 'twilio-ruby'

class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  def send_text_message(numb, new_message)
    # number_to_send_to = params[:number_to_send_to]
    number_to_send_to = numb

    # twilio_sid = ""
    twilio_sid=""
    twilio_token = ""
    twilio_phone_number = "2016853575"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    # uncomment this to send it
    # @twilio_client.account.sms.messages.create(
    #   :from => "+1#{twilio_phone_number}",
    #   :to => number_to_send_to,
    #   :body => new_message
    # )

  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    # @message.artist = Artist.first

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }


        # TWILIOOOOOOO
        num_to_send = @message.artist.phone_number
        new_message = @message.comment
        puts "THIS PHONE NUMBER...."
        puts num_to_send 
        # send_text_message(num_to_send, new_message)
           
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end



  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:comment, :due_date, :price, :artist_id, :user_id, :accepted)
    end
end
