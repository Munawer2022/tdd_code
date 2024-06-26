import 'package:fpdart/fpdart.dart';
import 'package:test123/data/datasources/theme/theme_data_source.dart';

import '../../../core/global.dart';
import '../../failure/theme/update_theme_failure.dart';
import '../../repositories/local/local_storage_base_api.dart';

class UpdateThemeUseCase {
  final ThemeDataSources _themeStore;
  final LocalStorageRepository _localStorageRepository;

  UpdateThemeUseCase(this._themeStore, this._localStorageRepository);

  Future<Either<UpdateThemeFailure, bool>> execute(bool isDarkTheme) {
    _themeStore.setTheme(isDarkTheme);
    return _localStorageRepository
        .setBool(key: GlobalConstants.themeKey, value: isDarkTheme)
        .then(
          (value) => value.fold(
            (l) => left(UpdateThemeFailure(error: l.error)),
            (r) => right(true),
          ),
        );
  }
}
