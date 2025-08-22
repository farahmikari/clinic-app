import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_types_event.dart';
part 'request_types_state.dart';

class RequestTypesBloc extends Bloc<RequestTypesEvent, RequestTypesState> {
  RequestTypesBloc() : super(RequestTypesInitial()) {
    on<CurrentRequestTypeIdChanged>((event, emit) {
      emit(
        RequestTypesUpdated(
          currentRequestTypeId: event.currentRequestTypeId,
          previousRequestTypeId: state.previousRequestTypeId,
          isDroppedDown: state.isDroppedDown,
          isRequestTypesWidgetActived: state.isRequestTypesWidgetActived,
        ),
      );
    });

    on<IsDroppedDownToggled>((event, emit) {
      emit(
        RequestTypesUpdated(
          currentRequestTypeId: state.currentRequestTypeId,
          previousRequestTypeId: state.previousRequestTypeId,
          isDroppedDown: !state.isDroppedDown,
          isRequestTypesWidgetActived: state.isRequestTypesWidgetActived,
        ),
      );
    });

    on<IsRequestTypesWidgetActivedIsToggled>((event, emit) {
      emit(
        RequestTypesUpdated(
          currentRequestTypeId: state.previousRequestTypeId,
          previousRequestTypeId: state.previousRequestTypeId,
          isDroppedDown: state.isDroppedDown,
          isRequestTypesWidgetActived: !state.isRequestTypesWidgetActived,
        ),
      );
    });

    on<CurrentAndPreviousRequestTypeIdsAreSet>((event, emit) {
      emit(
        RequestTypesUpdated(
          currentRequestTypeId: event.currentAndPreviousRequestTypeIds,
          previousRequestTypeId: event.currentAndPreviousRequestTypeIds,
          isDroppedDown: state.isDroppedDown,
          isRequestTypesWidgetActived: state.isRequestTypesWidgetActived,
        ),
      );
    });

    on<RequestTypesReset>((event, emit) {
      emit(
        RequestTypesUpdated(
          currentRequestTypeId: -1,
          previousRequestTypeId: -1,
          isDroppedDown: false,
          isRequestTypesWidgetActived: false,
        ),
      );
    });
  }
}
