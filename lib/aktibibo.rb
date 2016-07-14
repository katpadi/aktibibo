require 'aktibibo/version'
require 'active_record'
require 'aktibibo/activatable'
require 'aktibibo/errors'

module Aktibibo
end

ActiveRecord::Base.send(:include, Aktibibo::Activatable)
