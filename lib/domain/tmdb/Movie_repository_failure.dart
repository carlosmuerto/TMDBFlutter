import 'package:freezed_annotation/freezed_annotation.dart';

part 'Movie_repository_failure.freezed.dart';

@freezed //UNION
abstract class MovieRepositoryFailure with _$MovieRepositoryFailure {
  const factory MovieRepositoryFailure.unexpected() = _Unexpected;
  const factory MovieRepositoryFailure.unableToConnect() = _UnableToConnect;
}
