type Rsyslog::Filter_property_spec = Struct[{
  order => Pattern[/\d+/],
  property => String,
  operator => Pattern[/^!?(contains|isequal|startswith|regex|ereregex)/],
  value => Data,
  Optional[discard] => Boolean,
  Optional[write_async] => Boolean,
  Optional[target] => String,
  Optional[ensure] => Enum["present", "absent"]
}]
