# == Class: aws_scheduler::deps
#
# This module manages aws_scheduler dependencies and
# should *not* be called directly.
#
# 
class aws_scheduler::deps {
  case $::osfamily {
    'Debian': {
      include aws_scheduler::deps::debian
    }
    'RedHat': {
      include aws_scheduler::deps::redhat
    }
    default:  { fail("The aws_scheduler module does not support ${::osfamily}") }
  }
}
