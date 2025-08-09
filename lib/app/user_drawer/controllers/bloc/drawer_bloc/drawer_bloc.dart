import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawState> {
  final ZoomDrawerController zoomDrawerController;
  DrawerBloc(this.zoomDrawerController) : super(DrawerClosed()) {
    on<ToggleDrawerEvent>((event, emit) {
      if (state is DrawerOpened) {
        zoomDrawerController.close?.call();
        emit(DrawerClosed());
      } else {
        zoomDrawerController.open?.call();
        emit(DrawerOpened());
      }
    });
  }
}
