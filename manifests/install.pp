class rsyslog::install {
  $rsyslog::packages.each |String $package_name, Hash $package| {
    package {$package_name:
      * => $package
    }
  }
}
