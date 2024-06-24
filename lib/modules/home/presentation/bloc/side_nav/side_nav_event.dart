part of 'side_nav_bloc.dart';

@freezed
class SideNavEvent with _$SideNavEvent {
  const factory SideNavEvent.changeTab(int index) = _ChangeTab;
}
