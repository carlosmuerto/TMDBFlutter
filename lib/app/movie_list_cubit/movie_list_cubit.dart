import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'movie_list_state.dart';
part 'movie_list_cubit.freezed.dart';

@injectable
class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit() : super(_Initial());
}
