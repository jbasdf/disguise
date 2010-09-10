Disguise.configure do |config|
  config.use_domain_for_themes = false    # Changing theme per domain can be expense so it's off by default
  config.themes_enabled = true            # Turns disguise off/on.
  config.theme_path = 'themes'            # Path where themes will live. Calculated off the app root.
  config.theme_full_base_path = File.join(::Rails.root.to_s, config.theme_path) # Full path to the themes folder
end