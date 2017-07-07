class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end
  def show
    @kitten = Kitten.find(params[:id])
  end
  def new
    @kitten = Kitten.new

  end
  def edit
    @kitten = Kitten.find(params[:id])
  end
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten generated :)"
      redirect_to root_url
    else
      flash.now[:danger] = "Oops invalid kitten characteristics"
      render 'new'
    end
  end
  def update
    @kitten = Kitten.find(params[:kitten][:kitten_id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Kitten magically changed :)"
      redirect_to root_url
    else
      flash.now[:danger] = "Oops invalid kitten characteristics"
      render 'edit'
    end
  end
  def destroy
    Kitten.find(params[:id]).destroy
    flash[:success] = "Kitten mutilated D:"
    redirect_to root_url

  end


  private

    def kitten_params
      params.require(:kitten).permit(:name,:age,:cuteness,:softness)

    end
end
