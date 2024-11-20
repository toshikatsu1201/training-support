class CreatememosController < ApplicationController
  def index
  end
  
  def new
    @memo = Memo.find(params[:id])
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.user = current_user

    if @memo.save
      redirect_to @memo, notice: 'メモが作成されました'
    else
      render :new
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:user, :memo, :label, :work_date).merge(user_id: current_user.id)
  end
end
