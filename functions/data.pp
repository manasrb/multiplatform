function multiplatform::data {

  $base_param = {

   'multiplatform::ensure'         => present,
   'multiplatform::service_enable' => true,
   'multiplatform::service_ensure' => running,
   'multiplatform::port'           => 80,

}

  case $facts['os']['family'] {

   'Debian' : {

     $os_param = { 
         
           'multiplatform::package_name' => 'apache2',
           'multiplatform::service_name' => 'apache2',

}
}
  'RedHat' : {

     $os_param = {
          'multiplatform::package_name' => 'httpd',
          'multiplatform::service_name' => 'httpd',

}
}    

 'default' : {

   {}
}
}

   $base_param + $os_param
}
