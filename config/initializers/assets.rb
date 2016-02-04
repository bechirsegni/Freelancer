# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( MetroJs.css dialog.css dialog-sandra.css
                                                  owl.carousel.css jquery.nouislider.css
                                                  gallery.js MetroJs.min.js imagesloaded.pkgd.min.js
                                                  isotope.pkgd.min dialogFx.js owl.carousel.min.js
                                                  jquery.nouislider.min.js jquery.liblink.js dropzone.css
                                                  dropzone.min.js simple.css pages.social.min.js
                                                  isotope.pkgd.min.js stepsForm.js)