class Failure implements Exception {
  final dynamic message;
  final int? code;
  Map<String, dynamic>? messageArray;
  Failure({this.message, this.messageArray, this.code});

  @override
  String toString() {
    Object message = this.message;

    return "Exception: $message";
  }
}

class ServerFailure extends Failure {
  ServerFailure([dynamic message, Map<String, dynamic>? messageArray])
      : super(
          message: message ?? "server_exception",
          code: 500,
          messageArray: messageArray,
        );
}

class FirebaseFailure extends Failure {
  FirebaseFailure(
      {String? message, Map<String, dynamic>? messageArray, int? code})
      : super(
          message: message ?? "firebase_exception",
          code: code ?? 500,
        );
}

class GeneralFailure extends Failure {
  GeneralFailure(
      {String? message, Map<String, dynamic>? messageArray, int? code})
      : super(
          message: message ?? "general_failure",
          code: code ?? 500,
        );
}
