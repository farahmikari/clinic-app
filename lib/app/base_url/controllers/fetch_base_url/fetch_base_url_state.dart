part of 'fetch_base_url_bloc.dart';

sealed class FetchBaseUrlState extends Equatable {
  final String baseUrl;
  final bool isValid;
  const FetchBaseUrlState({required this.baseUrl, required this.isValid});

  @override
  List<Object> get props => [baseUrl, isValid];
}

final class FetchBaseUrlInitial extends FetchBaseUrlState {
  const FetchBaseUrlInitial() : super(baseUrl: "", isValid: false);
}

final class FetchBaseUrlUpdate extends FetchBaseUrlState {
  const FetchBaseUrlUpdate({required super.baseUrl, required super.isValid});
}
