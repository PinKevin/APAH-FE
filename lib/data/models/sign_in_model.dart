class SignInModel {
  final String token;

  SignInModel({required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    if (json['token'] == null) {
      throw Exception("API response does not contain a 'token'.");
    }
    return SignInModel(token: json['token']);
  }
}
