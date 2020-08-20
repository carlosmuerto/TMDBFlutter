import '../validators/values_failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation = 'Encountered a Value Failure at an urecoverable Point. Terminating [F].';
    return Error.safeToString('$explanation\n Failure was: $valueFailure');
  }
}

class NotAuthenticatedError extends Error {}
