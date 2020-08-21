import 'package:TMDBFlutter/domain/core/validators/Image_url_path.dart';
import 'package:TMDBFlutter/domain/core/validators/valid_string.dart';
import 'package:TMDBFlutter/domain/core/validators/values_failures.dart';
import 'package:TMDBFlutter/domain/core/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class ValidTitle extends ValueObject<String> {
  @override
  final Either<ValidStringFailure<String>, String> value;

  static const maxLength = 30;

  factory ValidTitle(String input) {
    assert(input != null, 'ValidTitle most be not null');
    return ValidTitle._(
      validateStringExceedingLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const ValidTitle._(this.value);
}

class ImageUrlPath extends ValueObject<String> {
  @override
  final Either<ImageUrlFailure<String>, String> value;

  factory ImageUrlPath({
    @required String url,
  }) {
    assert(url != null, 'url most be not null');
    return ImageUrlPath._(validateImageUrlFailure(url));
  }

  const ImageUrlPath._(this.value);
}
