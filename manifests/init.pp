# == Class: aws_scheduler
#
# Install aws_scheduler
#
#
class aws_scheduler (
  $aws_access_key_id     = undef, 
  $aws_secret_access_key = undef,
  $aws_region            = undef, 
  $tag                   = 'schedule',
  $exclude               = '[]',
  $default               = '{"mon": {"start": 5, "stop": 18},"tue": {"start": 5, "stop": 18},"wed": {"start": 5, "stop": 18},"thu": {"start": 5, "stop": 18}, "fri": {"start": 5, "stop": 18}}',  
  $script_path           = '/usr/sbin',
  $cron_minute           = '10',
  $cron_hour             = '*',
  $log                   = '/var/log/aws-scheduler_cron.log',
) {

  class { 'aws_scheduler::deps': }
  
  file { '/etc/aws-scheduler.cfg':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('aws_scheduler/aws-scheduler.cfg.erb'),
    require => Class['aws_scheduler::deps'],
  }
  
  file { "${script_path}/aws-scheduler.py":
    ensure  => 'file',
    owner   => root,
    group   => root,
    mode    => '0700',
    content => template('aws_scheduler/aws-scheduler.py.erb'),
    require => File['/etc/aws-scheduler.cfg'],
  }
  
 # cron::task{ 'aws scheduler':
 #  command => "${script_path}/aws-scheduler.py >> ${log}",
 #  minute  => $cron_minute,
 #  hour    => $cron_hour,
 #  require => File["${script_path}/aws-scheduler.py"],
 # }

}
