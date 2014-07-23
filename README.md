# lxde-cookbook

This cookbook is supposed to become useful in managing an LX Desktop Environment (LX).
For now it only contains an LWRP for managing desktop entries.

## Supported Platforms

Only tested on Ubuntu 14.04.

### Desktop Entry LWRP

```ruby
lxde_desktopentry 'google-chrome' do
    name "google-chrome"
    user "dsbaars"
end

# When a global desktop entry is available in /usr/share/applications it gets copied from there.
# if this behaviour is not desired, set try_application_dir to false
lxde_desktopentry 'google-chrome' do
    name "google-chrome"
    user "dsbaars"
    try_application_dir false
    icon "google-chrome"
    type "Application"
    exec "/usr/bin/google-chrome-stable"
end

lxde_desktopentry 'firefox' do
    name "firefox"
    user "dsbaars"
    action :remove
end
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `feature/add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Djuri Baars (dsbaars@gmail.com)
