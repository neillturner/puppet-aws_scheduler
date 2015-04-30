# == Class: aws_scheduler::deps::redhat
#
# This module manages aws_scheduler dependencies for redhat $::osfamily.
#
class aws_scheduler::deps::redhat {
  include ::epel
  Package { require => Class['epel'] }

  if ! defined(Package['python-devel']) {
    package { 'python-devel': ensure => installed }
  }
  if ! defined(Package['python-pip']) {
    package { 'python-pip': ensure => installed }
  }
  
  package { 'boto': 
      require => Package['python-pip'],
      ensure  => latest,
      provider => pip,
  }
  
  package { 'docopt': 
      require => Package['python-pip'],
      ensure  => latest,
      provider => pip,
  }  
  
}
