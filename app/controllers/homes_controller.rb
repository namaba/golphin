class HomesController < ApplicationController

  def index
    @condition = Condition.new
  end

  def index_2
  end

  def results
  end

  def create
    @plans = RWS::Gora::Plan.search(areaCode: conditions_params['area_code'], playDate: conditions_params['play_date'])
    raise @plans.first
  end

  def search
    condition = build_condition
    raise condition.inspect
    @plans = RWS::Gora::Plan.search(
        areaCode: condition.area_code,
        playDate: condition.play_date,
        minPrice: condition.min_price,
        maxPrice: condition.max_price,
        # startTimeZone: conditions_params["start_time_zone"],
        # planCaddie: 1,
        # planLunch: 1,
        # plan2sum: 1,
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
    raise @plans.count.inspect
    render :results

  end

  private

  def conditions_params
    params.require(:condition).permit(
      :play_date,
      :min_price,
      :max_price,
      :start_time_zone,
      :plan_caddie,
      area_code: [],
      )
  end

  def build_condition
    raise conditions_params.inspect
    @condition = Condition.new conditions_params
  end
end
