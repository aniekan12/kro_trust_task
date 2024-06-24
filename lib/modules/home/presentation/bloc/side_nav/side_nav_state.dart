part of 'side_nav_bloc.dart';

@freezed
class SideNavState with _$SideNavState {
  const factory SideNavState.setIndex({required int pageIndex}) = _Initial;
}
