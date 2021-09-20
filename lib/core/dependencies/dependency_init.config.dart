// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/language/language_bloc.dart' as _i6;
import '../repository/language_repository.dart' as _i4;
import '../utilities/app_logger.dart' as _i5;
import '../utilities/index.dart' as _i7;
import 'register_module.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')),
      instanceName: 'Dio');
  gh.lazySingleton<_i3.Dio>(
      () => registerModule.dioInterceptor(get<String>(instanceName: 'BaseUrl')),
      instanceName: 'Interceptor');
  gh.factory<_i4.LanguageRepository>(() => _i4.LanguageRepository());
  gh.singleton<_i5.AppLogger>(_i5.AppLogger());
  gh.singleton<_i6.LanguageBloc>(
      _i6.LanguageBloc(get<_i4.LanguageRepository>(), get<_i7.AppLogger>()));
  return get;
}

class _$RegisterModule extends _i8.RegisterModule {}
