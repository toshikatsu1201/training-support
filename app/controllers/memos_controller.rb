class MemosController < ApplicationController
  def index
    
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:user, :memo, :label, :work_date).merge(user_id: current_user.id)
  end
end
