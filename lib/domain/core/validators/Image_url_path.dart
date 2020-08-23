import 'package:dartz/dartz.dart';

import 'values_failures.dart';

abstract class ImageUrlValidators {
  static Either<ImageUrlFailure<String>, String> regex(String input) {
    const emailRegex = r"""(https?:\/\/.*\.(?:png|jpg))""";

    if (!RegExp(emailRegex).hasMatch(input)) {
      return left(ImageUrlFailure.notImageUrl(failedValue: input));
    }
    return right(input);
  }
}
