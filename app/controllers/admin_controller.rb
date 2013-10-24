class AdminController < ApplicationController
  def index
    @voters = Voter.all
  end
end
