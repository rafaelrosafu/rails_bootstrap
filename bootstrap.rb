# -*- encoding : utf-8 -*-
require File.expand_path(File.join(File.dirname(__FILE__), 'bootstrap_helper.rb' ))

apply_script "setup_gitignore"
apply_script "setup_gems"
apply_script "setup_rspec"
apply_script "setup_devise"
# add flash helpers
# add login/logout
apply_script "setup_spec_helper"
apply_script "setup_config_email"

generate :migration, 'add_name_and_type_to_system_users', 'name:string', 'type:string'
rake "db:migrate"
rake "db:test:prepare"

download_file 'https://github.com/twitter/bootstrap/blob/master/bootstrap.css', 'app/assets/stylesheets/bootstrap.css'

run "rm public/index.html"
generate :controller, 'Pages'
route "root :to => 'pages#index'"
run 'echo "<h1>Welcome</h1>" > app/views/pages/index.html.erb'

git :init
git :add => '.'
git :commit => "-am 'Initial commit'"
