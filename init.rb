#!/bin/env ruby
# encoding: utf-8

require 'redmine'
require File.dirname(__FILE__) + '/lib/issue_patch.rb'

ActiveSupport::Reloader.to_prepare do
  require_dependency 'issue'
  Issue.send(:include, Covid19IssuePatch::Patches::IssuePatch)
end

Redmine::Plugin.register :redmine_covid19_patches do
  name 'Патчи для проекта приема обращения по Covid19'
  author 'Ivan Petukhov'
  description ''
  version '0.0.2'
  url 'http://swan.perm.ru/'
  author_url 'https://github.com/EtherealLich'

end
