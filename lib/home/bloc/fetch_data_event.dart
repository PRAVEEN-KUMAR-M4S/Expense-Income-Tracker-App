part of 'fetch_data_bloc.dart';

sealed class FetchDataEvent extends Equatable {
  const FetchDataEvent();

  @override
  List<Object> get props => [];
}


final class FetchUserData extends FetchDataEvent{}
