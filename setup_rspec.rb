# -*- encoding : utf-8 -*-
run 'rm -rf test'

generate 'rspec:install'

run 'spork --bootstrap'

run 'mkdir spec/factories'
