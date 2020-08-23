import 'package:dartz/dartz.dart';

import 'values_failures.dart';

abstract class ValidStringValidators {
  static Either<ValidStringFailure<String>, String> exceedingLength(String input, int maxLength) {
    if (input.length <= maxLength) {
      return right(input);
    } else {
      return left(ValidStringFailure.exceedingLength(
        failedValue: input,
        max: maxLength,
      ));
    }
  }

  static Either<ValidStringFailure<String>, String> notEmpty(String input) {
    if (input.isNotEmpty) {
      return right(input);
    } else {
      return left(ValidStringFailure.empty(
        failedValue: input,
      ));
    }
  }

  static Either<ValidStringFailure<String>, String> singleline(String input) {
    if (!input.contains('\n')) {
      return right(input);
    } else {
      return left(ValidStringFailure.multiline(
        failedValue: input,
      ));
    }
  }
}
