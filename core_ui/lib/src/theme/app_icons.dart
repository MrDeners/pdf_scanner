import 'package:core_ui/core_ui.dart';

abstract final class AppIcons {
  static const String _basePath = kIconsPath;

  static const String _logoKey = '${_basePath}logo.svg';
  static const AppIcon logo = AppIcon(_logoKey);

  static const String _placeholderKey = '${_basePath}placeholder.svg';
  static const AppIcon placeholder = AppIcon(_placeholderKey);

  static const String _addDocumentKey = '${_basePath}add_document.svg';
  static const AppIcon addDocument = AppIcon(_addDocumentKey);

  static const String _scanKey = '${_basePath}scan.svg';
  static const AppIcon scan = AppIcon(_scanKey);

  static const String _checkKey = '${_basePath}check.svg';
  static const AppIcon check = AppIcon(_checkKey);

  static const String _closeKey = '${_basePath}close.svg';
  static const AppIcon close = AppIcon(_closeKey);

  static const String _editKey = '${_basePath}edit.svg';
  static const AppIcon edit = AppIcon(_editKey);

  static const String _searchKey = '${_basePath}search.svg';
  static const AppIcon search = AppIcon(_searchKey);

  static const String _shareKey = '${_basePath}share.svg';
  static const AppIcon share = AppIcon(_shareKey);

  static const String _swapHeightKey = '${_basePath}swap_height.svg';
  static const AppIcon swapHeight = AppIcon(_swapHeightKey);

  static const String _swapLowKey = '${_basePath}swap_low.svg';
  static const AppIcon swapLow = AppIcon(_swapLowKey);

  static const String _verticalDotesKey = '${_basePath}vertical_dotes.svg';
  static const AppIcon verticalDotes = AppIcon(_verticalDotesKey);

  static const String _rightArrowLongKey = '${_basePath}right_arrow_long.svg';
  static const AppIcon rightArrowLong = AppIcon(_rightArrowLongKey);

  static const String _arrowLeftKey = '${_basePath}arrow_left.svg';
  static const AppIcon arrowLeft = AppIcon(_arrowLeftKey);
}
