part of 'bottom_menu_cubit.dart';

class BottomMenuState extends Equatable {
  final int selectedIndex;
  final String initialRoute;

  const BottomMenuState({
    this.selectedIndex = 0,
    this.initialRoute = '/',
  });

  BottomMenuState copyWith({
    int? selectedIndex,
    String? initialRoute,
  }) =>
      BottomMenuState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        initialRoute: initialRoute ?? this.initialRoute,
      );

  @override
  List<Object> get props => [
        selectedIndex,
        initialRoute,
      ];
}
