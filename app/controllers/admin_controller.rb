class AdminController < ApplicationController
  protect_from_forgery

  # GET /admin/import_form
  def import_form
  end

  # POST /admin/import
  def import
    # TODO バリデーション
    # ファイルからインポート
    EthosImporterService::import params['name'].tempfile
    redirect_to members_path, flash: {success: 'ファイルインポートしました'}
  end
end
