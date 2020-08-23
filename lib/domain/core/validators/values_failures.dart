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

@freezed
abstract class UrlFailure<T> with _$UrlFailure<T> implements ValueFailure<T> {
  const factory UrlFailure.notUrl({@required T failedValue}) = _NotUrl<T>;
}

@freezed
abstract class ImageUrlFailure<T> with _$ImageUrlFailure<T> implements ValueFailure<T> {
  const factory ImageUrlFailure.notImageUrl({@required T failedValue}) = _NotImageUrl<T>;
}
