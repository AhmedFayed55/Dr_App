// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_sources/auth_data_source_impl.dart'
    as _i454;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/data_source/auth_data_source.dart'
    as _i710;
import '../../features/auth/domain/repositories/repo/auth_repository.dart'
    as _i281;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../../features/auth/presentation/manager/auth_cubit.dart' as _i888;
import '../networking/api_manager.dart' as _i943;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i943.ApiManager>(() => _i943.ApiManager());
    gh.factory<_i710.AuthDataSource>(
      () => _i454.AuthDataSourceImpl(apiManager: gh<_i943.ApiManager>()),
    );
    gh.factory<_i281.AuthRepository>(
      () =>
          _i662.AuthRepositoryImpl(authDataSource: gh<_i710.AuthDataSource>()),
    );
    gh.factory<_i1038.LoginUseCase>(
      () => _i1038.LoginUseCase(authRepository: gh<_i281.AuthRepository>()),
    );
    gh.factory<_i1010.RegisterUseCase>(
      () => _i1010.RegisterUseCase(authRepository: gh<_i281.AuthRepository>()),
    );
    gh.factory<_i888.AuthViewModel>(
      () => _i888.AuthViewModel(
        loginUseCase: gh<_i1038.LoginUseCase>(),
        registerUseCase: gh<_i1010.RegisterUseCase>(),
      ),
    );
    return this;
  }
}
