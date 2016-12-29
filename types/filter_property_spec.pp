type Rsyslog::Filter_property_spec = Struct[{
  order => Pattern[/\d+/],
  property => String,
  operator => Pattern[/^!?(contains|isequal|startswith|regex|ereregex)/],
  value => Data,
  discard => Boolean,
  Optional[ensure] => Enum["present", "absent"]
}]
