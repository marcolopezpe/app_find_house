class ResponseAuthModel {
  ResponseAuthModel({
    this.success,
    required this.requestToken,
    required this.idUser,
  });

  bool? success;
  String requestToken = "";
  int idUser = 0;

  ResponseAuthModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    requestToken = json['request_token'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "request_token": requestToken,
        "id_user": idUser,
      };
}
