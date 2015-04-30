# aws_scheduler

[![Puppet Forge](http://img.shields.io/puppetforge/v/neillturner/aws_scheduler.svg)](https://forge.puppetlabs.com/neillturner/aws_scheduler) 

## Description

Install aws scheduler - stop and start services according to schedule
This Puppet module will install [aws_scheduler](http://www.4synergy.nl/auto-start-stop-ec2-instances/). Tested on Centos 6. 

## Installation

`puppet module install --modulepath /path/to/puppet/modules neillturner-aws_scheduler`

## Usage

`class { 'aws_scheduler':
   aws_access_key_id     = 'MYAWSACCESSKEYID', 
   aws_secret_access_key = 'MYAWSSECRETACESSKEY',
   aws_region            = 'MYAWSREGION', 
   tag                   = 'schedule'
   exclude               = '[]'
   default               = '{"mon": {"start": 5, "stop": 18},"tue": {"start": 5, "stop": 18},"wed": {"start": 5, "stop": 18},"thu": {"start": 5, "stop": 18}, "fri": {"start": 5, "stop": 18}}'  
   script_path           = '/usr/sbin',
   cron_minute           = '10',
   cron_hour             = '*',
   log                   = '/var/log/aws-scheduler_cron.log',
}`

### Parameter

   aws_access_key_id     Aws Access Key for your account  
   aws_secret_access_key Aws Access  Secret Key for your account
   aws_region            Aws Region 
   tag                   tag using to hold json schedule defaults to 'schedule'
   exclude               Instance to exclude from scheduling default is '[]'
   default               json schedule array to default to (only used with the --force option)                 
                         '{"mon": {"start": 5, "stop": 18},"tue": {"start": 5, "stop": 18},"wed": {"start": 5, "stop": 18},"thu": {"start": 5, "stop": 18}, "fri": {"start": 5, "stop": 18}}'  
   script_path           path to store aws-scheduler.py script defaults to '/usr/sbin',
   cron_minute           cron minute to run the script defaults to '10' i.e. 10 past the hour,
   cron_hour             cron hour to run the script defaults to '*'    i.e. every hour,
   log                   log for cron defaults to '/var/log/aws-scheduler_cron.log' (aws-scheduler ptyhob script logs to /var/log/aws-scheduler.log) 

