import 'package:flutter/material.dart';
import 'package:flutter_important/data/data_source/local/my_cache.dart';
import 'package:flutter_important/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.initCache();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter App',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          onGenerateRoute: appRouter.onGenerateRoute,
        );
      },
    );
  }
}
