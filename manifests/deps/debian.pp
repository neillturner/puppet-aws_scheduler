# == Class: aws_scheduler::deps::debian
#
# This module manages aws_scheduler dependencies for Debian $::osfamily.
#
class aws_scheduler::deps::debian {
  if ! defined(Package['python-dev']) {
    package { 'python-dev': ensure => installed }
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
