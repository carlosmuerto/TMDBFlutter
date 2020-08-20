import 'package:freezed_annotation/freezed_annotation.dart';

part 'values_failures.freezed.dart';

abstract class ValueFailure<T> {}

@freezed
abstract class ValidStringFailure<T> with _$ValidStringFailure<T> implements ValueFailure<T> {
  const factory ValidStringFailure.empty({@required T failedValue}) = _Empty<T>;
  const factory ValidStringFailure.exceedingLength({
    @required T failedValue,
    @required int max,
  }) = _ExceedingLength<T>;
  const factory ValidStringFailure.multiline({@required T failedValue}) = _Multiline<T>;
  const factory ValidStringFailure.maxListLength({
    @required T failedValue,
    @required int max,
  }) = _MaxListLength<T>;
}
/*

Expected this library to be part of 'package:TMDBFlutter/domain/core/validators/Value_failures.dart', not 'package:TMDBFlutter/domain/core/validators/value_failures.dart'.
Try including a different part, or changing the name of the library in the part's part-of directive.

*/
