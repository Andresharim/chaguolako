class VotersController < ApplicationController
  before_action :check_if_admin_is_logged_in, only: [:index]

  # GET /voters
  # GET /voters.json
  def index
    @voters = Voter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @voters }
    end
  end

  # GET /voters/1
  # GET /voters/1.json
  def show
    @voter = Voter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @voter }
    end
  end

  # GET /voters/new
  # GET /voters/new.json
  def new
    @voter = Voter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @voter }
    end
  end

  # GET /voters/1/edit
  def edit
    @voter = Voter.find(params[:id])
  end

  # POST /voters
  # POST /voters.json
  def create
    @voter = Voter.new(params[:voter].permit(:email, :password, :phone, :username))

    respond_to do |format|
      if @voter.save
        format.html { redirect_to root_path, notice: "Thanks you for registering #{@voter.username}! We will be in touch!" }
        format.json { render json: @voter, status: :created, location: @voter }
      else
        format.html { render action: "new" }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /voters/1
  # PUT /voters/1.json
  def update
    @voter = Voter.find(params[:id])

    respond_to do |format|
      if @voter.update_attributes(params[:voter].permit(:email, :password, :phone, :username))
        format.html { redirect_to @voter, notice: 'Voter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voters/1
  # DELETE /voters/1.json
  def destroy
    @voter = Voter.find(params[:id])
    @voter.destroy

    respond_to do |format|
      format.html { redirect_to voters_url }
      format.json { head :no_content }
    end
  end
end
