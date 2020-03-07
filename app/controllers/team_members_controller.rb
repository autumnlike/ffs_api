class TeamMembersController < ApplicationController
  protect_from_forgery
  before_action :set_team_member, only: [:show, :destroy]

  # POST /team_members
  # POST /team_members.json
  def create
    @team_member = TeamMember.new(team_member_params.permit(:team_id, :member_id))

    if @team_member.save
      redirect_to team_path(id: @team_member.team_id), flash: {success: 'メンバーを追加しました'}
    else
      redirect_to team_path(id: @team_member.team_id), flash: {danger: 'メンバー追加を失敗しました'}
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team_member.destroy
    redirect_to team_path(id: @team_member.team_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_member_params
      params.fetch(:team_member, {})
    end
end
