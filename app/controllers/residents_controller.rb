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
    day_start = Date.new(@rent_y, @rent_m ,@rent_d)
    day_finish = Date.new(@move_y, @move_m ,@move_d)
    today = Date.today

    sa = day_finish - day_start
    @income = (@resident.income * 12 / 365).round * sa.to_i
      # if @day_rent && @day_move && @day_buy  && @day_sell    # 入居日と退去日の入力があった場合
      #   if @day_rent >= @day_buy && @day_move == nil && @day_sell == nil
      #     sa = @day_rent - @today
      #     @income = @resident.income * 12 / 365 * sa.to_i
      #   elsif @day_rent <= @day_buy && @day_move == nil && @day_sell == nil
      #     sa = @day_buy - @today
      #     @income = @resident.income * 12 / 365 * sa.to_i
      #   elsif @day_rent >= @day_buy && @day_move && @day_sell == nil
      #     sa = @day_rent - @day_move
      #     @income = @resident.income * 12 / 365 * sa.to_i
      #   elsif @day_rent >= @day_buy && @day_move == nil && @day_sell
      #     sa = @day_rent - @day_sell
      #     @income = @resident.income * 12 / 365 * sa.to_i
      #   elsif @day_rent <= @day_buy && @day_move  && @day_sell == nil
      #     sa = @day_buy - @day_move
      #     @income = @resident.income * 12 / 365 * sa.to_i
      #   elsif @day_rent <= @day_buy && @day_move == nil && @day_sell
      #     sa = @day_buy - @day_sell
      #     @income = @resident.income * 12 / 365 * sa.to_i
      #   else
      #     @income = 0
      #   end
        # elsif @day_rent == nil && @day_buy && @day_move == nil && @day_sell == nil
        #   @income = 0
        # elsif @day_rent == nil && @day_buy && @day_move == nil && @day_sell
        #   @income = 0
        # elsif @day_rent == nil && @day_buy && @day_move == nil && @day_sell
        #   sa = @day_move - @day_rent
        #   @income = @resident.income * 12 / 365 * sa.to_i
        # elsif @day_rent && @day_move == nil                  # 入居日があって退去日がない場合
        #   if @day_sell                                      # 入居日があって売却日がある場合
        #     sa = @day_sell - @day_rent
        #     @income = @resident.income * 12 / 365 * sa.to_i
        #   else
        #     sa = @today - @day_rent
        #     @income = @resident.income * 12 / 365 * sa.to_i
        #   end
        # elsif @day_rent == nil && @day_move                  # 入居日がなくて退去日がある場合
        #   sa = @day_move - @day_buy
        #   @income = @resident.income * 12 / 365 * sa.to_i
      
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
    params.require(:resident).permit(:name,:income,:rent_y,:rent_m,:rent_d,:move_y,:move_m,:move_d,:post_id)
  end

  def set_resident
    @resident = Resident.find(params[:id])
    @post = Post.find(@resident.post_id)
  end

  def set_date
    @resident = Resident.find(params[:id])
    @post = Post.find(@resident.post_id)
    @day_rent = Date.new(@resident.rent_y, @resident.rent_m ,@resident.rent_d)
    @day_move = Date.new(@resident.move_y, @resident.move_m ,@resident.move_d)
    @day_buy = Date.new(@post.buy_year, @post.buy_month ,@post.buy_day)
    @day_sell = Date.new(@post.sell_year, @post.sell_month ,@post.sell_day)
    @today = Date.today

    # 収入発生の起算日　（入居日or購入日）
    if @day_rent && @day_move && @day_buy && @day_sell
      if @day_rent >= @day_buy # 入居日が購入日より後の場合
        @rent_y = @resident.rent_y
        @rent_m = @resident.rent_m
        @rent_d = @resident.rent_d
      elsif @day_rent <= @day_buy# 入居日が購入日より前の場合
        @rent_y = @post.buy_year
        @rent_m = @post.buy_month
        @rent_d = @post.buy_day
      elsif @day_rent <= @day_buy
      else
        @rent_y = 0
        @rent_m = 0
        @rent_d = 0
      end
      # 締め日の計算 （退去日or売却日）
      if @day_move <= @day_sell  # 退去日が売却日より前の場合
        @move_y = @resident.move_y
        @move_m = @resident.move_m
        @move_d = @resident.move_d
      elsif @day_move >= @day_sell # 退去日が売却日より後の場合
        @move_y = @post.sell_year
        @move_m = @post.sell_month
        @move_d = @post.sell_day
      else
        @move_y = 0
        @move_m = 0
        @move_d = 0
      end
    
    else
      @rent_y = 0
      @rent_m = 0
      @rent_d = 0
    end
   end
end
