import 'package:TMDBFlutter/domain/core/validators/Image_url_path.dart';
import 'package:TMDBFlutter/domain/core/validators/valid_string.dart';
import 'package:TMDBFlutter/domain/core/validators/values_failures.dart';
import 'package:TMDBFlutter/domain/core/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class ValidTitle extends ValueObject<String> {
  @override
  final Either<ValidStringFailure<String>, String> value;

  static const maxLength = 100;

  factory ValidTitle(String input) {
    assert(input != null, 'ValidTitle most be not null');
    return ValidTitle._(
      ValidStringValidators.exceedingLength(input, maxLength)
          .flatMap(ValidStringValidators.notEmpty)
          .flatMap(ValidStringValidators.singleline),
    );
  }

  const ValidTitle._(this.value);
}

class ValidOverview extends ValueObject<String> {
  @override
  final Either<ValidStringFailure<String>, String> value;

  static const maxLength = 1000;

  factory ValidOverview(String input) {
    assert(input != null, 'ValidTitle most be not null');
    return ValidOverview._(
      ValidStringValidators.exceedingLength(input, maxLength)
          .flatMap(ValidStringValidators.notEmpty),
    );
  }

  const ValidOverview._(this.value);
}

class ImageUrlPath extends ValueObject<String> {
  @override
  final Either<ImageUrlFailure<String>, String> value;

  factory ImageUrlPath(String url) {
    assert(url != null, 'url most be not null');
    return ImageUrlPath._(ImageUrlValidators.regex(url));
  }

  const ImageUrlPath._(this.value);
}
