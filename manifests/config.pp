class multiplatform::config(
String $service_name = $::multiplatform::service_name,
Integer $port = $::multiplatform::port
){

  file{ '/tmp/bobsled.zip':

    ensure => file,
    source => 'puppet:///modules/multiplatform/bobsled.zip',
    notify => Exec['unzip'],

}
  file { '/var/www/html':

    ensure => directory,
    owner   => root,
    mode   => '0755',

}
 
 

  exec { 'unzip':

    command     => '/usr/bin/unzip /tmp/bobsled.zip -d /var/www/html',
    user        =>  root,
    require     =>  File['/var/www/html'],
    refreshonly =>  true,

}
   case $facts['os']['family']{
      'Debian': {
             
 file { '/etc/apache2/sites-available/000-default.conf':
 
     ensure => file,
     source => 'puppet:///modules/multiplatform/000-default.conf',
     notify => Service['http'],
}
}
     'Redhat': {

 
 file { '/etc/httpd/conf/httpd.conf':
 
     ensure  => file,
     content => template('multiplatform/httpd.conf.erb'),
     notify  => Service['http'], 
}
}    
}    
    
} 
