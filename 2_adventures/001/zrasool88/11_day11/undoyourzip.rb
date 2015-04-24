#!/usr/bin/env ruby

archive = ARGV.shift

backup_archive = archive + '.backup'

`unzip #{archive}`
`cp #{archive} ./#{backup_archive}`
`rm #{archive}`
