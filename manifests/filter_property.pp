define rsyslog::filter_property (
  Pattern[/\d+/] $order = "00",
  String $property,
  Pattern[/^!?(contains|isequal|startswith|regex|ereregex)/] $operator,
  Data $value,
  Boolean $discard = false,
  Enum["present", "absent"] $ensure = "present"
) {
  unless defined(Class["rsyslog"]) {
    fail("You must include the rsyslog base class before using any rsyslog defined resources")
  }

  file {"${rsyslog::config_dir}/${order}-filter_property-${name}.conf":
    owner => "root",
    group => "root",
    mode => "0644",
    ensure => $ensure,
    content => epp("rsyslog/filter_property.conf.epp"),
    require => File[$rsyslog::config_dir]
  }

  if $rsyslog::service_manage {
    File["${rsyslog::config_dir}/${order}-filter_priority-${name}.conf"] {
      notify => Service[$rsyslog::service_name]
    }
  }
}
