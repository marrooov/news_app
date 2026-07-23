// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_app/features/home/data/repo/home_data_source_imp.dart'
    as _i763;
import 'package:news_app/features/home/data/repo/home_repo_imp.dart' as _i710;
import 'package:news_app/features/home/domain/repo/home_data_source_interface.dart'
    as _i540;
import 'package:news_app/features/home/domain/repo/home_repo_interface.dart'
    as _i799;
import 'package:news_app/features/home/domain/use_case/get_news_use_case.dart'
    as _i558;
import 'package:news_app/features/home/presentation/view_model/view_cubit/home_cubit.dart'
    as _i551;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i540.HomeDataSourceInterface>(() => _i763.HomeDataSourceImp());
    gh.factory<_i799.HomeRepoInterface>(
      () => _i710.HomeRepoImp(gh<_i540.HomeDataSourceInterface>()),
    );
    gh.factory<_i558.GetNewsUseCase>(
      () => _i558.GetNewsUseCase(gh<_i799.HomeRepoInterface>()),
    );
    gh.factory<_i551.HomeCubit>(
      () => _i551.HomeCubit(gh<_i558.GetNewsUseCase>()),
    );
    return this;
  }
}
