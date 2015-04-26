# [TEARDOWN}

verbosity = { verbose: $VERBOSE }

# Two things I am aware of here:
#   * I am using a non-standard reference (at leaset uncommon for me in Ruby)
#   for the string interpolation
#   * referring to something in a way that you #   must be aware of the names
#   of the key for that hash.

puts "The current verbosity level is %{verbose}" % verbosity
warn "This is just a warning" if verbosity[:verbose]

# yuck, not really impressed, not to mention that in a larger project, you risk
# a TON of warnings that may not be helpful.

# [TEARDOWN}
