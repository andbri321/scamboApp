class Site::Profile::AdsController < Site::ProfileController
  before_action :set_ad, only: [:edit,:update]

  def index
    @ads = Ad.to_the(current_member)
  end

  def edit

  end

  def update
    if @ad.update(params_id)
      redirect_to site_profile_ads_path, notice: "Anúncio atualizado com sucesso!"
    else
      render :edit
    end
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(params_id)
    @ad.member = current_member

    if @ad.save
      redirect_to site_profile_ads_path, notice: "Anúncio cadastrado com sucesso!"
    else
      render :new
    end
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def params_id
    params.require(:ad).permit(:id,:title,:category_id,:price,:description,:picture)
  end
end
