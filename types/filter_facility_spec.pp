type Rsyslog::Filter_facility_spec = Struct[{
  order => Pattern[/\d+/],
  facility => Variant[String, Array[String]],
  actions => Variant[String, Array[String]],
  Optional[ensure] => Enum["present", "absent"]
}]
