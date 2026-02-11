import 'package:flutter/material.dart';
import 'package:goldex/core/routing/app_router.dart';
import 'package:goldex/core/routing/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.homeScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
