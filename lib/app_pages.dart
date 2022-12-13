import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landsurvey/app/modules/dashboard/view/dashboard_view.dart';
import 'package:landsurvey/app/modules/home/views/home_view.dart';

import 'app_routes.dart';
import 'app_routes.dart' as tr;

class AppPages {
  static final config = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/home',
    routes: [
      AppRoutes.page(
          path: '/home',
          name: 'home',
          child: const HomeView(),
          transition: tr.Transition.FadeTransition),
      AppRoutes.page(
          path: '/dashboard',
          name: 'dashboard',
          child: const DashboardView(),
          transition: tr.Transition.FadeTransition),
    ],
  );
}
