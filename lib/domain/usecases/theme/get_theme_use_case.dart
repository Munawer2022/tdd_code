import 'package:fpdart/fpdart.dart';

import 'package:test123/data/datasources/theme/theme_data_source.dart';
import '../../failure/theme/get_theme_failure.dart';

import '../../../core/global.dart';
import '../../repositories/local/local_storage_base_api.dart';

class GetThemeUseCase {
  final LocalStorageRepository _localStorageRepository;
  final ThemeDataSources _themeStore;

  GetThemeUseCase(
    this._localStorageRepository,
    this._themeStore,
  );

  Future<Either<GetThemeFailure, Unit>> execute() {
    return _localStorageRepository.getBool(key: GlobalConstants.themeKey).then(
          (value) => value.fold(
            (l) => left(GetThemeFailure(error: l.error)),
            (isDarkTheme) {
              _themeStore.setTheme(isDarkTheme);
              return right(unit);
            },
          ),
        );
  }
}
