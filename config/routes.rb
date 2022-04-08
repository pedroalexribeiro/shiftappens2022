# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Devise routes
  devise_for :organizations
  devise_for :donors

  # Redirect when users are authenticated
  authenticated :organization do
    root to: redirect('/organization/'), as: :organization_authenticated_root
  end
  authenticated :donor do
    root to: redirect('/donors/feed'), as: :donor_authenticated_root
  end
  # unauthenticated do
  #  root to: redirect('/'), as: :unauthenticated_root
  # end

  namespace :organizations do
    resources :events
    # Except create to make not mess with devise create
    resources :profiles, except: [:create]
  end

  namespace :donors do
    resources :achievements
    # Except create to make not mess with devise create
    resources :profiles, except: [:create]
    # Only allow creating donations
    resources :donations, only: [:create]
    # Only allow accessing feed
    resources :feed, only: [:index]
  end

  # Defines the root path route ("/")
  root 'homepage#index'
end
