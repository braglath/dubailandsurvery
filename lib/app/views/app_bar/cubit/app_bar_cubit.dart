import 'package:backdrop/backdrop.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:landsurvey/app/modules/home/home_imports.dart';

part 'app_bar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {
  AppBarCubit() : super(const AppBarPage(currentPage: 'home'));

  void changePage(BuildContext context, {required String pageName}) {
    final currentPage = Router.of(context)
        .routeInformationProvider
        ?.value
        .location!
        .split('/')[1];
    if (currentPage == pageName) {
      //? we are in same page so dont navigate
      //? just close the backdrop filter
      Backdrop.of(context).concealBackLayer();
    } else {
      context.goNamed(pageName);
      emit(AppBarPage(currentPage: pageName));
    }
  }
}
