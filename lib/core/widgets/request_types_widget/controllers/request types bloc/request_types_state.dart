part of 'request_types_bloc.dart';

sealed class RequestTypesState {
  const RequestTypesState({
    required this.currentRequestTypeId,
    required this.previousRequestTypeId,
    required this.isDroppedDown,
    required this.isRequestTypesWidgetActived,
  });

  final int currentRequestTypeId;
  final int previousRequestTypeId;
  final bool isDroppedDown;
  final bool isRequestTypesWidgetActived;
}

final class RequestTypesInitial extends RequestTypesState {
  RequestTypesInitial()
    : super(
        currentRequestTypeId: -1,
        previousRequestTypeId: -1,
        isDroppedDown: false,
        isRequestTypesWidgetActived: false,
      );
}

final class RequestTypesUpdated extends RequestTypesState {
  RequestTypesUpdated({
    required super.currentRequestTypeId,
    required super.previousRequestTypeId,
    required super.isDroppedDown,
    required super.isRequestTypesWidgetActived,
  });
}
