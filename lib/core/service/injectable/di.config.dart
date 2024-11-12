// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_database/firebase_database.dart' as _i345;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../features/admin_panel/bloc/admin_bloc.dart' as _i542;
import '../../../features/auth/bloc/auth_bloc.dart' as _i1003;
import '../storage/storage_service.dart' as _i865;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1003.AuthBloc>(() => _i1003.AuthBloc());
    gh.singleton<_i542.AdminBloc>(() => _i542.AdminBloc());
    gh.factory<_i865.StorageService>(() => _i865.StorageServiceImpl(
          gh<_i460.SharedPreferences>(),
          gh<_i345.FirebaseDatabase>(),
        ));
    return this;
  }
}
