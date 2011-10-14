# -*- encoding : utf-8 -*-
run 'rm .gitignore'
file '.gitignore', <<-CODE
.bundle
db/*.sqlite3
log/*.log
tmp/
.sass-cache/
.DS_Store

.metrics

coverage/
*.swo
*.swp
*~

config/database.yml
config/email.yml
CODE
