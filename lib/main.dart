import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_important/business_logic/colors_cubit/colors_cubit.dart';
import 'package:flutter_important/business_logic/counter_cubit/counter_cubit.dart';
import 'package:flutter_important/business_logic/providers/counter_provider.dart';
import 'package:flutter_important/data/data_source/local/my_cache.dart';
import 'package:flutter_important/presentation/router/app_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/providers/onboarding_provider.dart';
import 'core/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.initCache();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => CounterProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => OnBoardingProvider(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CounterCubit(),
              ),
              BlocProvider(
                create: (context) => ColorsCubit(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter App',
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
              ),
              onGenerateRoute: appRouter.onGenerateRoute,
            ),
          ),
        );
      },
    );
  }
}
