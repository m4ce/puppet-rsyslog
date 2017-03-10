define rsyslog::filter_facility (
  Pattern[/\d+/] $order = "00",
  Variant[String, Array[String]] $facility,
  Variant[String, Array[String]] $actions,
  Enum["present", "absent"] $ensure = "present"
) {
  unless defined(Class["rsyslog"]) {
    fail("You must include the rsyslog base class before using any rsyslog defined resources")
  }

  file {"${rsyslog::config_dir}/${order}-filter_facility-${name}.conf":
    owner => "root",
    group => "root",
    mode => "0644",
    ensure => $ensure,
    content => epp("rsyslog/filter_facility.conf.epp", {
      facility => $facility,
      actions => $actions
    }),
    require => File[$rsyslog::config_dir],
    notify => Service[$rsyslog::service_name]
  }
}
