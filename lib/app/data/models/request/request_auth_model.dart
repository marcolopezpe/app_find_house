// https://javiercbk.github.io/json_to_dart/
class RequestAuthModel {
  String email;
  String password;

  RequestAuthModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
