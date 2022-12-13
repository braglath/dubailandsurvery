part of 'app_bar_cubit.dart';

abstract class AppBarState extends Equatable {
  final String currentPage;
  const AppBarState({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}

class AppBarPage extends AppBarState {
  const AppBarPage({required super.currentPage});

  @override
  List<Object> get props => [currentPage];
}
