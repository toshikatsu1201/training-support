class MemosController < ApplicationController
  def new
    @memo = Memo.find_by(id: params[:id])
    unless @memo
      redirect_to root_path, alert: "指定されたメモが見つかりません。"
    end
  end
end
