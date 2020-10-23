class PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit,:update,:destroy]
  before_action :set_date_data, only:[:show,:update]
  

  PER = 4
  def index
    @posts = Post.page(params[:page]).per(PER)
    @resident = Resident.all
  end

  def new
    @post = Post.new
  end

  def create # 売却日が購入日より前に入力できてしまうのでそれの回避を行う
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
     # 保有期間計算
      if @post.buy_year && @post.buy_month && @post.buy_day
        if @post.sell_year && @post.sell_month && @post.sell_day
          d1 = @buy_y_m_d
          d2 = @sell_y_m_d
          @sa = d2 - d1
        else
          d1 = @buy_y_m_d
          d2 = Date.today
          @sa = d2 - d1
        end
      else
        @sa = 0
      end

    # 入居者情報
      @resident = Resident.new
      @residents = @post.residents
    # 仲介手数料（購入時）
      if @post.buy != 0
        @brokerage_fee_buy = ((@post.buy*0.03+60000)*1.1).floor
      else
        @brokerage_fee_buy = 0
      end
    # 登記費用
      if @post.buy != 0
        if @post.values != 0
          @registration_fee = (@post.values*0.02).floor+50000
        else
          @registration_fee = (@post.buy*0.02).floor+50000
        end
      else
        @registration_fee = 0
      end
    
    # 「固定資産税評価額相当額」計算式
      if @post.values != 0
        @temporary_values = @post.values
      else
        @temporary_values = (@post.buy * 0.8).floor
      end

    # 「不動産取得税」計算式
      @acquisition_tax = (@temporary_values*0.014).floor

    # 「固定資産税」計算式
      @property_tax = ((@temporary_values*0.6*0.003) + (@temporary_values*0.4*0.014)).floor / 365 * @sa.to_i

    # 管理費（マンション）
      @m_management_fee = @post.m_management_fee * 12 / 365 * @sa.to_i

    # 積立金（マンション）
      @m_repair_fund = @post.m_repair_fund * 12 / 365 * @sa.to_i

    # １日あたり金利計算
      @interest_rate = @post.interest_rate * 12 / 365 * @sa.to_i

    # 物件運営管理費（集金代行など費用について）
      @management_fee = @post.management_fee * 12 / 365 * @sa.to_i

    # 仲介手数料（売却時）
      if @post.sell != 0
        @brokerage_fee_sell = ((@post.sell*0.03+60000)*1.1).floor
      else
        @brokerage_fee_sell = 0
      end
    # 総費用
      @total_costs = @post.buy + @brokerage_fee_buy + @registration_fee + 
                      @acquisition_tax + @property_tax + @post.buy_stamp_cost + 
                        @m_management_fee + @m_repair_fund + @post.repair_cost + 
                          @interest_rate + @post.rent_cost + @post.banking_fee + 
                            @management_fee + @post.fire_insurance + @post.surveying_cost + 
                              @post.other_cost + @brokerage_fee_sell
    # 売却益
    if @post.sell_year && @post.sell_month && @post.sell_day
      @profit = @post.sell - @total_costs - @brokerage_fee_sell
    else
      @profit = 0
    end
    # 入居者賃料計算
      @date_sell =  @sell_y_m_d
      @date_buy = @buy_y_m_d
    # 総利益（売却益＋家賃収入）
    
      @residents.each do |resident|
        @name = resident.name
        @income = resident.income
        @day_rent = Date.new(resident.rent_y, resident.rent_m ,resident.rent_d)
        @day_move = Date.new(resident.move_y, resident.move_m ,resident.move_d)
        @day_buy = Date.new(@post.buy_year, @post.buy_month ,@post.buy_day)
        @day_sell = Date.new(@post.sell_year, @post.sell_month ,@post.sell_day)
        @today = Date.today

        if @day_rent >= @day_buy && @day_move >= @day_sell # 退去日 - 入居日
          sa = @day_move - @day_rent
          @sum_income = @income * 12 / 365 * sa.to_i
        elsif @day_rent <= @day_buy && @day_move >= @day_sell # 退去日 - 購入日
          sa = @day_move - @day_buy
          @sum_income = @income * 12 / 365 * sa.to_i
        elsif @day_move <= @day_sell && @day_rent >= @day_buy # 売却日 - 入居日
          sa = @day_sell - @day_rent
          @sum_income = @income * 12 / 365 * sa.to_i
        elsif @day_move <= @day_sell && @day_rent <= @day_buy  # 売却日 - 購入日
          sa = @day_sell - @day_buy
          @sum_income = @income * 12 / 365 * sa.to_i
        else
          @sum_income = 0
        end
      end # each文のend

  end

  def edit
    
  end

  def update 
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private
    def post_params
      params.require(:post).permit(
          :name,:buy,:explanation,:buy_stamp_cost,:repair_cost,:interest_rate,:rent_cost,:banking_fee,
          :management_fee,:fire_insurance,:sell,:surveying_cost,:sell_stamp_cost,:buy_year,:buy_month,
          :buy_day,:sell_year,:sell_month,:sell_day,:debt,:net_worth,:cash_flow,:ownership_period,
          :house_layout,:m2,:b_income,:other_cost,:m_management_fee,:m_repair_fund,:rent_year,:rent_month,
          :rent_day,:move_year,:move_month,:move_day,:values
        )
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def set_date_data  
      if @post.buy_year && @post.buy_month && @post.buy_day && @post.sell_year && @post.sell_month && @post.sell_day
        @buy_y_m_d = Date.new(@post.buy_year, @post.buy_month ,@post.buy_day)
        @sell_y_m_d = Date.new(@post.sell_year, @post.sell_month ,@post.sell_day)
        
      else
        @buy_y_m_d = Date.today
        @sell_y_m_d = Date.today
      end
    end

    
end
