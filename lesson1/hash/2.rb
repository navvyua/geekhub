hash = {
  'yes' => 23,
  'b' => 'travel',
  'yesterday' => 34,
  :yesss => :fg,
  try: 30,
  key: 'some value',
  'yesterday1' => 34,
  'yesteryear' => 2014
}

print 'Number of keys which start with \'yes\': '
puts hash.select { |k| k.to_s.start_with?('yes') }.size
