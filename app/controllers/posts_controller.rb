class PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit,:update,:destroy]
  
  PER = 4
  def index
    @posts = Post.page(params[:page]).per(PER)
    @resident = Resident.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to "/"
    else
      render :new
    end
  end

  def show
    if @post.buy_year || @post.buy_month || @post.buy_day != nil
      if @post.sell_year || @post.sell_month || @post.sell_day != nil
        d1 = Date.new(@post.buy_year, @post.buy_month ,@post.buy_day)
        d2 = Date.new(@post.sell_year, @post.sell_month ,@post.sell_day)
        @sa = d2 - d1
      else
        d1 = Date.new(@post.buy_year, @post.buy_month ,@post.buy_day)
        d2 = Date.today
        @sa = d2 - d1
      end
    else
      @sa = 0
    end
    if @post.rent_year || @post.rent_month || @post.rent_day != nil
      d3 = Date.new(@post.rent_year, @post.rent_month ,@post.rent_day)
      d2 = Date.new(@post.sell_year, @post.sell_month ,@post.sell_day)
      @sa_rent = d2 - d3
    else
      @sa_rent = 0
    end
    if @post.move_year || @post.move_month || @post.move_day != nil
      d3 = Date.new(@post.rent_year, @post.rent_month ,@post.rent_day)
      d4 = Date.new(@post.move_year, @post.move_month ,@post.move_day)
      @sa_rent_net = d4 - d3
    else
      @sa_rent_net = 0
    end

    if @post == nil
      @post = 0
    end

    # if d4 == d2
    #   @total_b_income = @post.b_income * 12 / 365 * @sa_rent.to_i
    #   @total_sales = @post.sell + @total_b_income
    # else
    #   @total_b_income = @post.b_income * 12 / 365 * @sa_rent_net.to_i
    #   @total_sales = @post.sell + @total_b_income
    # end
    @resident = Resident.new
    @residents = @post.residents

  end

  def edit
    
  end

  def update
    @post.update(post_params)
    redirect_to "/"
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
      params.require(:post).permit(:name,:explanation,:buy,:buy_brokerage_fee,:registration_fee,:real_estate_acquisition_tax,:property_tax,:buy_stamp_cost,:repair_cost,:interest_rate,:rent_cost,:banking_fee,:management_fee,:fire_insurance,:sell,:surveying_cost,:sell_brokerage_fee,:sell_stamp_cost,:buy_year,:buy_month,:buy_day,:sell_year,:sell_month,:sell_day,:debt,:net_worth,:cash_flow,:ownership_period,:house_layout,:m2,:b_income,:other_cost,:m_management_fee,:m_repair_fund,:rent_year,:rent_month,:rent_day,:move_year,:move_month,:move_day)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    
end
