import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'errors/errors.dart';
import 'validators/Value_failure.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containig the [ValueObject]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((l) => throw UnexpectedValueError(l), id);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  bool get isValit => value.isRight();

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
