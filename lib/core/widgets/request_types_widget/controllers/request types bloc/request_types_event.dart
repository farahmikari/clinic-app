part of 'request_types_bloc.dart';

sealed class RequestTypesEvent {}

class CurrentRequestTypeIdChanged extends RequestTypesEvent {
  final int currentRequestTypeId;

  CurrentRequestTypeIdChanged({required this.currentRequestTypeId});
}

class IsDroppedDownToggled extends RequestTypesEvent {}

class IsRequestTypesWidgetActivedIsToggled extends RequestTypesEvent {}

class CurrentAndPreviousRequestTypeIdsAreSet extends RequestTypesEvent {
  final int currentAndPreviousRequestTypeIds;

  CurrentAndPreviousRequestTypeIdsAreSet({
    required this.currentAndPreviousRequestTypeIds,
  });
}

class RequestTypesReset extends RequestTypesEvent {}
