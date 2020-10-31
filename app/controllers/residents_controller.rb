class ResidentsController < ApplicationController

  before_action :set_resident, only:[:edit,:show,:update,:destroy]
  before_action :set_date, only:[:edit,:show,:update]

  def index
    @residents = Resident.all
  end

  def new
    @resident = Resident.new
  end

  def create
     @resident = Resident.create(resident_params)
     if @resident.save
      redirect_to resident_path(@resident.id)
    else
      render :new
    end
  end

  def show
    if @resident.rent_date >= @post.str_date
      day_start = @resident.rent_date
    else
      day_start = @post.str_date
    end
    if @resident.move_date <= @post.fin_date
      day_finish = @resident.move_date
    else
      day_finish = @post.fin_date
    end
    today = Date.today
    sa = day_finish - day_start
    @income = (@resident.income * 12 / 365).round * sa.to_i
  end
  
  def edit
  end

  def update
    if @resident.update(resident_params)
      redirect_to resident_path(@resident.id)
    else
      render :edit
    end
  end

  def destroy
    @resident.destroy
    redirect_to "/residents"
  end
  
  private
  def resident_params
    params.require(:resident).permit(:name,:income,:rent_y,:rent_m,:rent_d,:move_y,:move_m,:move_d,:post_id,:rent_date,:move_date)
  end

  def set_resident
    @resident = Resident.find(params[:id])
    @post = Post.find(@resident.post_id)
  end

  def set_date
    @resident = Resident.find(params[:id])
    @post = Post.find(@resident.post_id)
    @day_rent = @resident.rent_date
    @day_move = @resident.move_date
    @day_buy = @post.str_date
    @day_sell = @post.fin_date
    @today = Date.today

    # 収入発生の起算日　（入居日or購入日）
    if @day_rent && @day_move && @day_buy && @day_sell
      if @day_rent >= @day_buy # 入居日が購入日より後の場合
        @rent_y_m_d = @resident.rent_date
      elsif @day_rent <= @day_buy# 入居日が購入日より前の場合
        @rent_y_m_d = @post.str_date
      elsif @day_rent <= @day_buy
      else
        @rent_y_m_d = ""
      end
      # 締め日の計算 （退去日or売却日）
      if @day_move <= @day_sell  # 退去日が売却日より前の場合
        @move_y_m_d = @resident.move_date
      elsif @day_move >= @day_sell # 退去日が売却日より後の場合
        @move_y_m_d = @post.fin_date
      else
        @move_y_m_d = ""
      end
    else
      @rent_y_m_d = ""
    end
   end
end
