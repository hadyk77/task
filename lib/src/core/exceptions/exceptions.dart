class CustomException implements Exception {
  final dynamic message;

  CustomException([this.message]);
}

class GeneralException extends CustomException {
  @override
  dynamic get message => "something went wrong";
}

class ServerException implements CustomException {
  // ignore: prefer_final_fields
  late String _message;
  late int? _statusCode;
  late Map<String, dynamic> _errors;

  ServerException({
    String? error,
    Map<String, dynamic>? errors,
    int? statusCode,
  }) {
    _message = error ?? "something went wrong";
    _errors = errors ?? {};
    _statusCode = statusCode;
  }

  @override
  String get message => _message;
  Map<String, dynamic> get errors => _errors;
  int? get statusCode => _statusCode;
}
