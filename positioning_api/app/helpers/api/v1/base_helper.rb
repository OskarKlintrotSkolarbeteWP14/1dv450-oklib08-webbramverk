module Api::V1::BaseHelper
  def all_parameters
    ActionController::Parameters.new(
      op:
      {
        position_id: params[:position_id],
        user_id: params[:user_id],
        tag_ids: params[tag_ids: []],
        item: params[:item],
        note: params[:note],
        datetime: params[:datetime]
      },
      position:
      {
        lng: params[:lng],
        lat: params[:lat],
        place: params[:place],
        region: params[:region],
        country: params[:country]
      },
      tag:
      {
        tag: params[:tag]
      },
      user:
      {
        username: params[:username],
        email: params[:email],
        first_name: params[:first_name],
        last_name: params[:last_name],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      }
    )
  end
end
