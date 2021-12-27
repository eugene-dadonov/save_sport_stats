import 'package:equatable/equatable.dart';

class ViewState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Show when loading;
class LoadingState extends ViewState {}

/// Show when content is ready and we have to show it;
class ContentState extends ViewState {}

/// Show when content is ready, but it is empty;
class EmptyState extends ViewState {}

/// Show when there is an critical error;
class ErrorState extends ViewState {
  final String errorMessage;

  ErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
