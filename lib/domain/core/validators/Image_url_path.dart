//(https?:\/\/.*\.(?:png|jpg)) is a jpg or png url

import 'package:TMDBFlutter/domain/core/validators/values_failures.dart';
import 'package:dartz/dartz.dart';

Either<ImageUrlFailure<String>, String> validateImageUrlFailure(String input) {
  const emailRegex = r"""(https?:\/\/.*\.(?:png|jpg))""";

  if (!RegExp(emailRegex).hasMatch(input)) {
    return left(ImageUrlFailure.notImageUrl(failedValue: input));
  }
  return right(input);
}
