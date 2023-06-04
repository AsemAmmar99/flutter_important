import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_important/business_logic/global_cubit/global_cubit.dart';
import 'package:flutter_important/core/constants.dart';
import 'package:flutter_important/core/my_cache_keys.dart';
import 'package:flutter_important/data/data_source/local/my_cache.dart';
import 'package:flutter_important/presentation/styles/colors.dart';
import 'package:flutter_important/presentation/widgets/default_text.dart';
import 'package:flutter_important/presentation/widgets/default_text_button.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late GlobalCubit cubit;

  @override
  void initState() {
    cubit = GlobalCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: DefaultText(
          text: AppLocalizations.of(context)!.settingsScreen,
          textSize: 16.sp,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: DefaultText(
                text: AppLocalizations.of(context)!.themeMode,
                textSize: 18.sp,
              ),
            ),
            BlocBuilder<GlobalCubit, GlobalState>(
              builder: (context, state) {
                return Switch(
                  activeColor: barsColor,
                  value: cubit.isDarkTheme,
                  onChanged: (value) => cubit.changeAppTheme(),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: DefaultText(
                text: AppLocalizations.of(context)!.changeLanguageTo,
                textSize: 18.sp,
              ),
            ),
            DefaultTextButton(
              onPressed: () {
                if (MyCache.getString(key: MyCacheKeys.appLanguage) == 'ar') {
                  appLanguage = 'en';
                  cubit.setLocale(const Locale('en'));
                } else {
                  appLanguage = 'ar';
                  cubit.setLocale(const Locale('ar'));
                }
              },
              child: DefaultText(
                text: AppLocalizations.of(context)!.oppositeLanguage,
                textSize: 18.sp,
                weight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
