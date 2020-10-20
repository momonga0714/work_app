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
    redirect_to resident_path(@resident.id)
  end

  def show
     if @rent_y || @rent_m || @rent_d != nil && @move_y || @move_y || @move_y != nil
        d1 = Date.new(@rent_y, @rent_m ,@rent_d)
        d2 = Date.new(@move_y, @move_m ,@move_d)
        sa = d2 - d1
        @income = @resident.income * 12 / 365 * sa.to_i
     elsif @rent_y || @rent_m || @rent_d != nil && @move_y || @move_y || @move_y == nil 
        d1 = Date.new(@rent_y, @rent_m ,@rent_d)
        d2 = Date.today
        sa = d2 - d1
        @income = @resident.income * 12 / 365 * sa.to_i
      elsif @rent_y || @rent_m || @rent_d == nil && @move_y || @move_y || @move_y != nil 
        d1 = Date.new(@post.buy_year, @post.buy_month ,@post.buy_day)
        d2 = Date.new(@move_y, @move_m ,@move_d)
        sa = d2 - d1
        @income = @resident.income * 12 / 365 * sa.to_i
      else
        @income = "期間が未入力のため不明です"
      end
  end
  
  def edit
    
  end

  def update
    if @resident.update(resident_params)
      
      redirect_to resident_path(@resident.id)
    else
      render :edit
      flash[:notice] = "正しく入力してください"
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
    # 収入発生の起算日　（入居日or購入日）
    if @resident.rent_y != nil || @resident.rent_y != nil || @resident.rent_y != nil
      if Date.new(@resident.rent_y, @resident.rent_m ,@resident.rent_d) > Date.new(@post.buy_year, @post.buy_month ,@post.buy_day)
        @rent_y = @resident.rent_y
        @rent_m = @resident.rent_m
        @rent_d = @resident.rent_d
      else
        @rent_y = @post.buy_year
        @rent_m = @post.buy_month
        @rent_d = @post.buy_day
      end
    else
      @rent_y = @post.buy_year
      @rent_m = @post.buy_month
      @rent_d = @post.buy_day
    end
    # 締め日の計算　（退去日or売却日）
    if @resident.move_y != nil || @resident.move_y != nil || @resident.move_y != nil
      if Date.new(@resident.move_y, @resident.move_m ,@resident.move_d) < Date.new(@post.sell_year, @post.sell_month ,@post.sell_day)
        @move_y = @resident.move_y
        @move_m = @resident.move_m
        @move_d = @resident.move_d
      else
        @move_y = @post.sell_year
        @move_m = @post.sell_month
        @move_d = @post.sell_day
      end
    end
  end
end
