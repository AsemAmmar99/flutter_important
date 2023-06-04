import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_important/core/constants.dart';
import 'package:flutter_important/core/my_cache_keys.dart';
import 'package:flutter_important/data/data_source/local/my_cache.dart';

import '../../core/l10n/l10n.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of<GlobalCubit>(context);

  // Theme Setting

  bool isDarkTheme = false;

  void changeAppTheme(){
    isDarkTheme = !isDarkTheme;
    MyCache.putBool(key: MyCacheKeys.theme, value: isDarkTheme);
    emit(ChangeAppThemeState());
  }

  void getAppTheme(){
    isDarkTheme = MyCache.getBool(key: MyCacheKeys.theme,);
  }

  // Languages Setting

  Locale _localeVar = Locale(MyCache.getCurrentLanguage());

  Locale get getLocale{
    if(MyCache.getCurrentLanguage() == 'ar'){
    appLanguage = 'ar';
  }else{
  appLanguage = 'en';
  }
    return _localeVar;
}

  void setLocale(Locale locale){
    if(L10n.all.contains(locale)){
      _localeVar = locale;
      MyCache.putString(key: MyCacheKeys.appLanguage, value: _localeVar.toString());
    }
    emit(ChangeAppLanguageState());
  }
}
