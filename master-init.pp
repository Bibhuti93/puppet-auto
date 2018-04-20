#Enable autosign
file { '/etc/puppetlabs/puppet/autosign.conf':
       ensure => file,
       owner => 'root',
       group => 'root',
       content => 'echo hostname',
      }

#Install GIT package
package { 'git':
          ensure => present,
       }

#Create cron job to pull master & agent GIT repos
