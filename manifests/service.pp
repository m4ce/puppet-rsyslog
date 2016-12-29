class rsyslog::service {
  if $rsyslog::service_manage {
    service {$rsyslog::service_name:
      ensure => $rsyslog::service_ensure,
      enable => $rsyslog::service_enable,
      subscribe => Package[keys($rsyslog::packages)]
    }
  }
}
