class SignupEntity{
  final String name = 'My Name';
  final String email;
  final String password;
  final String avatar = 'https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_30_ece4ac0bba.jpg';

  SignupEntity({
    required this.email,
    required this.password,
  });
}

class SigninEntity{
  final String email;
  final String password;
  
  SigninEntity({
    required this.email,
    required this.password,
  });
}
