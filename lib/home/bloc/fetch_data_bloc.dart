import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/home/repository/fetch_user.dart';
import 'package:expense_tracker/models/user_model.dart';

part 'fetch_data_event.dart';
part 'fetch_data_state.dart';

class FetchDataBloc extends Bloc<FetchDataEvent, FetchDataState> {
  final FetchUserDataService userDataService;
  FetchDataBloc(this.userDataService) : super(FetchDataInitial()) {
    on<FetchUserData>((event, emit) async {
      emit(const FetchUserDataLoading(isLoading: true));
      try {
        final UserModel user = await userDataService.fetchUserData();
        print(user.name);
        emit(FetchUserDataSuccess(userModel: user));
      } catch (e) {
        emit(FetchUserDataFailure(error: e.toString()));
      }
    });
  }
}
