class rsyslog (
  Hash $opts,
  Hash $packages,
  Rsyslog::Filter_properties $filter_properties,
  Rsyslog::Filter_facilities $filter_facilities,
  String $config_dir,
  Boolean $config_dir_purge,
  String $config_file,
  Boolean $config_file_manage,
  String $service_name,
  Boolean $service_enable,
  Boolean $service_manage,
  Enum["running", "stopped"] $service_ensure,
) {
  include rsyslog::install
  include rsyslog::config
  include rsyslog::service

  $filter_properties.each |String $filter_name, Rsyslog::Filter_property_spec $filter| {
    rsyslog::filter_property {$filter_name:
      * => $filter
    }
  }

  $filter_facilities.each |String $filter_name, Rsyslog::Filter_facility_spec $filter| {
    rsyslog::filter_facility {$filter_name:
      * => $filter
    }
  }
}
