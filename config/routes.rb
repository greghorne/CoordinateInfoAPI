Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope "/api" do
    scope "/v1" do
      get 'coord_info' => 'coordinate_info#coord_info'
    end
  end

end