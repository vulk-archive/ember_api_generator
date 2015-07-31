class <%= class_name.pluralize %>Controller < ApplicationController
  def index
    # probably should search by authtoken
    # if params[:xxx_id]
    #   <%= class_name.downcase.pluralize %> = <%= class_name %>.where(xxx_id: params[:xxx_id])
    # else
      @<%= class_name.downcase.pluralize %> = <%= class_name %>.all
    # end 
    if @<%= class_name.downcase.pluralize %>
      render json: {:<%= class_name.downcase.pluralize %> => @<%= class_name.downcase.pluralize %>}
    else
      render json: {:errors => 'No <%= class_name.downcase.pluralize %> found'}, :status => 404
    end
  end

  def show
    @<%= class_name.downcase.pluralize %> = <%= class_name %>.find(params[:id])
    render json: {:<%= class_name.downcase.pluralize %> => @<%= class_name.downcase.pluralize %>}
  end

  def create
    @<%= class_name.downcase.pluralize %> = <%= class_name %>.create(<%= class_name.downcase %>_params)
    if @<%= class_name.downcase.pluralize %>.save
      render json: {:<%= class_name.downcase.pluralize %> => @<%= class_name.downcase.pluralize %>}
    else
      render :json => { :errors => @<%= class_name.downcase.pluralize %>.errors.full_messages }, :status => 422
    end
  end

  def update 
    @<%= class_name.downcase.pluralize %> = <%= class_name %>.find(params[:id])
    if @<%= class_name.downcase.pluralize %>.update!(<%= class_name.downcase %>_params)
      render json: {:<%= class_name.downcase.pluralize %> => @<%= class_name.downcase.pluralize %>}
    else
      render :json => { :errors => @<%= class_name.downcase.pluralize %>.errors.full_messages }, :status => 422
    end
  end

  def destroy 
    @<%= class_name.downcase.pluralize %> = <%= class_name %>.find(params[:id])
    if @<%= class_name.downcase.pluralize %>
      @<%= class_name.downcase.pluralize %>.save
      if @<%= class_name.downcase.pluralize %>.destroy!
        render json: {:<%= class_name.downcase.pluralize %> => @<%= class_name.downcase.pluralize %>}
      else
        render :json => { :errors => @<%= class_name.downcase.pluralize %>.errors.full_messages }, :status => 422
      end
    else
      render :json => { :errors => @<%= class_name.downcase.pluralize %>.errors.full_messages }, :status => 422
    end
  end

  protected

  def <%= class_name.downcase %>_params
    # add your column list here
    params.require(:<%= class_name.downcase %>).permit(
    )
  end
end
