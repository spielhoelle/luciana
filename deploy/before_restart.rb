########################################################################################################################
# fingerprinted assets into public/assets folder
########################################################################################################################

# application in /srv/www/{application}
app_short_name  = release_path.split("/")[3]
rails_env       = node[:deploy][app_short_name][:rails_env]

########################################################################################################################
# Create REVISION file with commit hash (as Capistrano does)
########################################################################################################################

run "cd #{release_path} && git rev-parse HEAD > REVISION"

########################################################################################################################
# Compile fingerprinted assets into public/assets folder
########################################################################################################################

run "cd #{release_path} && RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
