action :add do
    new_resource.updated_by_last_action(false)


    directory "/home/#{new_resource.user}/Desktop" do
      owner "#{new_resource.user}"
      group "#{new_resource.user}"
      mode 0755
      recursive true
      action :create
    end

    if ::File.exists?("/usr/share/applications/#{new_resource.name}.desktop") and new_resource.try_application_dir
        r = remote_file "Global application desktop-entry" do
            path "/home/#{new_resource.user}/Desktop/#{new_resource.name}.desktop"
            source "file:///usr/share/applications/#{new_resource.name}.desktop"
            owner "#{new_resource.user}"
            group "#{new_resource.user}"
            mode 0755
        end

        new_resource.updated_by_last_action(r.updated_by_last_action?)
    else
        t = template "/home/#{new_resource.user}/Desktop/#{new_resource.name}.desktop" do
            source    "desktop-entry.erb"
            variables({
                :name => new_resource.name,
                :icon => new_resource.icon,
                :type => new_resource.type,
                :exec => new_resource.exec
            })
            cookbook 'lxde'
        end

        new_resource.updated_by_last_action(t.updated_by_last_action?)
    end
end

action :remove do
  if ::File.exists?("/home/#{new_resource.user}/Desktop/#{new_resource.name}.desktop")
    file "/home/#{new_resource.user}/Desktop/#{new_resource.name}.desktop" do
      action :delete
    end

    new_resource.updated_by_last_action(true)
  end
end
