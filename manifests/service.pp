class multiplatform::service(
String $service_name = $::multiplatform::service_name, 
Enum   $service_ensure = $::multiplatform::service_ensure,
Boolean $service_enable = $::multiplatform::service_enable
){

  service{ http:
  
   ensure => $service_ensure,
   name   => $service_name,
   enable => $service_enable,

}
}
