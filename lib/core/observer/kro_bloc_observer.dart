import 'package:bloc/bloc.dart';
import 'package:kro_resources/common/logger/kro_logger_factory.dart';

var log = LoggerFactory.getLogger('KroBlocObserver');

class KroBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log.info(event.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log.info(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log.info(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log.error(error.toString());
    super.onError(bloc, error, stackTrace);
  }
}
