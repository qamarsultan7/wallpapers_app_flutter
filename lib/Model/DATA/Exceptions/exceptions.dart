// ignore_for_file: unused_field

class AppExceptions implements Exception {
  final String? _prefix;
  final String? _message;
  AppExceptions([this._message, this._prefix]);
  @override
  String toString() {
    return '$_prefix' '$_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message])
      : super(message, 'Error During Communication');
}

class TimeoutException extends AppExceptions {
  TimeoutException([String? message]) : super('TimeOut');
}

class BadRequest extends AppExceptions {
  BadRequest([String? message]) : super('Bad Request');
}

class Unauthorizedrequest extends AppExceptions {
  Unauthorizedrequest([String? message]) : super('');
}

class FetchDataExption extends AppExceptions {
  FetchDataExption([String? message]) : super(message, 'Invalid Input');
}
