part of 'fetch_data_bloc.dart';

sealed class FetchDataState extends Equatable {
  const FetchDataState();

  @override
  List<Object> get props => [];
}

final class FetchDataInitial extends FetchDataState {}

final class FetchUserDataSuccess extends FetchDataState {
  final UserModel userModel;

  const FetchUserDataSuccess({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

final class FetchUserDataLoading extends FetchDataState {
  final bool isLoading;

  const FetchUserDataLoading({required this.isLoading});
}

final class FetchUserDataFailure extends FetchDataState {
  final String error;

  const FetchUserDataFailure({required this.error});

    @override
  List<Object> get props => [error];
}
