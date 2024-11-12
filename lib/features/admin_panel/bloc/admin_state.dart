part of 'admin_bloc.dart';

@freezed
class AdminState with _$AdminState {
  const factory AdminState.initial() = _Initial;
  const factory AdminState.loading() = _Loading;
  const factory AdminState.loaded({required AdminViewModel viewModel}) =
      _Loaded;
}

@freezed
class AdminViewModel with _$AdminViewModel {
  const factory AdminViewModel({
    @Default([]) List<Student> students,
  }) = _AdminViewModel;
}
