import 'package:educontrol/core/service/injectable/di.dart';
import 'package:educontrol/core/service/models/student.dart';
import 'package:educontrol/core/service/storage/storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'admin_bloc.freezed.dart';
part 'admin_event.dart';
part 'admin_state.dart';

@Singleton()
class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final viewModel = const AdminViewModel();

  AdminBloc() : super(const AdminState.initial()) {
    on<_LoadUsers>(_onLoadUsers);
  }

  _onLoadUsers(_LoadUsers event, Emitter<AdminState> emit) async {
    emit(const AdminState.loading());
    final students = await getIt<StorageService>().getStudents();
    emit(
      AdminState.loaded(
        viewModel: viewModel.copyWith(students: students),
      ),
    );
  }
}
