Rails.configuration.stripe = {
    :stripe_publishable_key => ENV[STRIPE_PUBLISHABLE_KEY],
    :stripe_secret_key      => ENV[STRIPE_SECRET_KEY]
}

Stripe.api_key = Rails.application.secrets.stripe_secret_key