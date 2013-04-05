class uwsgi::params {

  case $::operatingsystem {
    Debian,Ubuntu: {
      $configdir = '/etc/uwsgi/apps-enabled'
      $package = ['uwsgi', 'uwsgi-extra']
      $rack_plugin = ['uwsgi-plugin-rack-ruby1.8','rubygems','ruby-rack']
      $python_plugin = ['uwsgi-plugin-python','uwsgi-plugin-python3','uwsgi-plugin-http']
    }
    default: {
      notify { "${module_name}_unsupported":
        message => "The ${module_name} module is not supported on ${operatingsystem}",
      }
    }
  }
}
