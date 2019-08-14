class MembersController < ApplicationController
  before_action :set_member, only: [:show]

  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to root_path
    end
end
