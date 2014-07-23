#
# Cookbook Name:: lxde
# Resource:: desktopentry
#
actions :add, :remove
default_action :add if defined?(default_action) # Chef > 10.8

# Needed for Chef versions < 0.10.10
def initialize(*args)
  super
  @action = :add
end

attribute :name, :kind_of => String, :name_attribute => true
attribute :icon, :kind_of => String, :default => ''
attribute :exec, :kind_of => String, :default => ''
attribute :type, :kind_of => String, :default => 'Application'
attribute :user, :kind_of => String
attribute :try_application_dir, :kind_of => [TrueClass, FalseClass], :default => true
