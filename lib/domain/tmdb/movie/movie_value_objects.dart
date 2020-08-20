import 'package:TMDBFlutter/domain/core/validators/values_failures.dart';
import 'package:TMDBFlutter/domain/core/validators/valid_string.dart';
import 'package:TMDBFlutter/domain/core/value_object.dart';
import 'package:dartz/dartz.dart';

class ValidTitle extends ValueObject<String> {
  @override
  final Either<ValidStringFailure<String>, String> value;

  static const maxLength = 30;

  factory ValidTitle(String input) {
    assert(input != null, 'ValidTitle most be not null');
    return ValidTitle._(
      validateNoteExceedingLength(input, maxLength).flatMap(validateNoteNotEmpty),
    );
  }

  const ValidTitle._(this.value);
}
