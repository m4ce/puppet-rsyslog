type Rsyslog::Filter_facility_spec = Struct[{
  order => Pattern[/\d+/],
  facility => Variant[String, Array[String]],
  destination => String,
  write_async => Boolean,
  Optional[ensure] => Enum["present", "absent"]
}]
