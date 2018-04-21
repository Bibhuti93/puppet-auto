# puppet-auto
Repository for puppet-demo project on GCE (project ID: puppet-demo)

This directory is only for master "puppet-master".
Sub-directory "manifests" for placing other manifests that will be applied for this master. The manifests folder will cotain only one manifest and should be named init.pp.
init.pp Manifest file will be pulled & executed at regular intervals by cron job started from master-post-startup.pp
