if defined?(ChefSpec)
  def add_lxde_desktopentry(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:lxde_desktopentry, :add, resource_name)
  end

  def remove_lxde_desktopentry(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:lxde_desktopentry, :remove, resource_name)
  end
end
