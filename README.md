
<!-- <td><%= listings.user %></td>
        <td><%= listings.title %></td>
        <td><%= listings.room_type %></td>
        <td><%= listings.num_of_rooms %></td>
        <td><%= listings.price %></td>
        <td><%= listings.description %></td>
        <td><%= listings.house_rules %></td> -->

<!-- <div class="search">

<%= form_tag :search_listing,method: :get do %>
    <p>
        <%= text_field_tag :search ,params[:search] %>
        <%= submit_tag "Search" %>
    </p>

<% end %>

</div> -->


  def user_from_params

    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    gender = user_params.delete(:gender)
    phone = user_params.delete(:phone)
    country = user_params.delete(:country)


    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.first_name = first_name
      user.last_name = last_name
      user.email = email
      user.password = password
      user.gender = gender
      user.phone = phone
      user.country = country
    end
  end