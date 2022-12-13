import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landsurvey/app/views/app_bar/cubit/app_bar_cubit.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'app/data/theme/theme.dart';
import 'app/modules/home/views/home_view.dart';
import 'app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBarCubit()),
      ],
      child: MaterialApp.router(
        builder: (context, child) => ResponsiveWrapper.builder(child,
            // maxWidth: 1200,
            // minWidth: 480,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        useInheritedMediaQuery: true,
        routerConfig: AppPages.config,
      ),
    );
  }
}
