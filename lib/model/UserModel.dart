class UserModel {
  UserModel({
    required this.data,
    required this.message,
    required this.status,
  });
  late final List<Data> data;
  late final String message;
  late final int status;

  UserModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  Data({
    required this.email,
    required this.cin,
    required this.firstName,
    required this.lastName,
    required this.fcmToken,
    required this.appUserRole,
    required this.locked,
    required this.enabled,
    required this.phoneNumber,
    required this.authorities,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.credentialsNonExpired,
    required this.solde,
    required this.gender,
  });
  late final String email;
  late final String cin;
  late final String firstName;
  late final String lastName;
  late final String fcmToken;
  late final String appUserRole;
  late final bool locked;
  late final bool enabled;
  late final String phoneNumber;
  late final List<Authorities> authorities;
  late final bool accountNonExpired;
  late final bool accountNonLocked;
  late final bool credentialsNonExpired;
  late final int solde;
  late final String gender;

  Data.fromJson(Map<String, dynamic> json){
    email = json['email'];
    cin = json['cin'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fcmToken = json['fcm_token'];
    appUserRole = json['appUserRole'];
    locked = json['locked'];
    enabled = json['enabled'];
    phoneNumber = json['phoneNumber'];
    authorities = List.from(json['authorities']).map((e)=>Authorities.fromJson(e)).toList();
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
    solde = json['solde'];
    gender = json['gender'];
  }

}

class Authorities {
  Authorities({
    required this.authority,
  });
  late final String authority;

  Authorities.fromJson(Map<String, dynamic> json){
    authority = json['authority'];
  }

}