class HomesController < ApplicationController
  before_action :build_condition, only: :results
  before_action :condition_check, only: :results

  def index
    @condition = Condition.new
  end

  def index_2
  end

  def results
    @plans = search_plans
    cource_ids = @plans.pluck('golf_course_id')
    cources = RakutenWebService::Gora::Course.search(golfCourseId: cource_ids)
    @address_hash =
      cources.each_with_object({}) do |c, hash|
        hash[c.golf_course_id] = c.address
      end
  end

  def detail
    # 80111
    @cource ||= RakutenWebService::Gora::CourseDetail.find(80111)
    # @cource = RakutenWebService::Gora::CourseDetail.find(params[:golf_course_id])
  end

  private

  def conditions_params
    params.require(:condition).permit(
      :play_date,
      :min_price,
      :max_price,
      :plan_caddie,
      area_code: [],
      start_time_zone: [],
      )
  end

  def build_condition
    @condition = Condition.new conditions_params
  end

  def condition_check
    return if @condition.area_code && @condition.play_date
    empty_params = []
    empty_params << 'エリア' if @condition.area_code.blank?
    empty_params << 'プレー日' if @condition.play_date.blank?
    joined_empty_params = empty_params.join(',')
    redirect_to root_path, alert: "#{joined_empty_params}を入力してください"
  end

  def search_plans
    area_code = @condition.area_code.join(',')
    start_time_zone = @condition.start_time_zone&.join(',')
    RWS::Gora::Plan.search(
        areaCode: area_code,
        playDate: @condition.play_date,
        minPrice: @condition.min_price,
        maxPrice: @condition.max_price,
        startTimeZone: start_time_zone,
        planCaddie: @condition.plan_caddie,
        planLunch: @condition.plan_lunch,
        plan2sum: @condition.plan_2sum,
        # NGプラン対象
        # planCaddie：キャディ付
        # planCart：乗用カート有
        # planStay：宿泊プラン
        # planLesson：レッスン
        # planOpenCompe：オープンコンペ 【NEW】
        # planRegularCompe：コンペ【NEW】
        # planHalfRound：9Hプレー
        # planEarly：早朝プレー
        # 例:NGPlan=planCart,planLesson,planHalfRound
        # NGPlan: 'planLesson,planHalfRound'
      )
    # @plans = RWS::Gora::Plan.search(areaCode: conditions_params['area_code'], playDate: conditions_params['play_date'], minPrice: 0, maxPrice: 25000)
  end
end
