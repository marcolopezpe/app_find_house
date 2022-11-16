class ResponseSignUpModel {
  ResponseSignUpModel({
    this.message = "",
  });

  String message;

  factory ResponseSignUpModel.fromJson(Map<String, dynamic> json) =>
      ResponseSignUpModel(
        message: json["message"],
      );
}
