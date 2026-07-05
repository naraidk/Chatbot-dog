class ApplicationController < ActionController::Base
  # Devise removed: use a fallback user so app controllers can still work
  helper_method :current_user, :user_signed_in?

  def current_user
    @current_user ||= User.first_or_create!(email: "user@example.com")
  end

  def user_signed_in?
    current_user.present?
  end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
