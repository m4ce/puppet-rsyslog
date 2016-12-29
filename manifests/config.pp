class rsyslog::config {
  file {$rsyslog::config_dir:
    owner => "root",
    group => "root",
    mode => "0755",
    ensure => "directory",
    recurse => true,
    purge => $rsyslog::config_dir_purge
  }

  if $rsyslog::config_file_manage {
    file {$rsyslog::config_file:
      owner => "root",
      group => "root",
      mode => "0644",
      content => epp("rsyslog/rsyslog.conf.epp")
    }
  }

  if $rsyslog::service_manage {
    File[$rsyslog::config_dir] {
      notify => Service[$rsyslog::service_name]
    }

    if $rsyslog::config_file_manage {
      File[$rsyslog::config_file] {
        notify => Service[$rsyslog::service_name]
      }
    }
  }
}
