type Rsyslog::Filter_property_spec = Struct[{
  order => Pattern[/\d+/],
  property => String,
  operator => Pattern[/^!?(contains|isequal|startswith|regex|ereregex)/],
  value => Data,
  actions => Variant[String, Array[String]],
  Optional[ensure] => Enum["present", "absent"]
}]
