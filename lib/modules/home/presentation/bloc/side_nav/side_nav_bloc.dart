import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'side_nav_state.dart';
part 'side_nav_event.dart';
part 'side_nav_bloc.freezed.dart';

class SideNavBloc extends Bloc<SideNavEvent, SideNavState> {
  SideNavBloc() : super(const SideNavState.setIndex(pageIndex: 0)) {
    on<SideNavEvent>((events, emit) async {
      events.map(changeTab: (_) {
        emit(SideNavState.setIndex(pageIndex: _.index));
      });
    });
  }
}
