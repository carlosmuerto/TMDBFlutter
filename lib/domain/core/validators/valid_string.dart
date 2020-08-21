import 'package:dartz/dartz.dart';

import 'values_failures.dart';

Either<ValidStringFailure<String>, String> validateStringExceedingLength(
    String input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValidStringFailure.exceedingLength(
      failedValue: input,
      max: maxLength,
    ));
  }
}

Either<ValidStringFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValidStringFailure.empty(
      failedValue: input,
    ));
  }
}

Either<ValidStringFailure<String>, String> validateStringSingleline(String input) {
  if (!input.contains('\n')) {
    return right(input);
  } else {
    return left(ValidStringFailure.multiline(
      failedValue: input,
    ));
  }
}
