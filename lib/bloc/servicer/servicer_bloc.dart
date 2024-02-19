import 'dart:async';
import 'package:adminservice/models/servicermodel.dart';
import 'package:adminservice/repositories/servecerdata.dart';
import 'package:bloc/bloc.dart';
part 'servicer_event.dart';
part 'servicer_state.dart';

class ServicerBloc extends Bloc<ServicerEvent, ServicerState> {
  ServicerBloc() : super(ServicerInitial()) {
    on<UserDataFetchEvent>(fetchServicer);
  }

  FutureOr<void> fetchServicer(
      UserDataFetchEvent event, Emitter<ServicerState> emit) async {
        print('got in');
    final userDetails = await ServicerRepo().getallServicer();
 print(userDetails);
    userDetails.fold((error) {
      emit(ServicerDataFetchErrorState(message: error.message));
    }, (response) {
      final List rawdata = response['pending'];

      final List<ServicerModel> servicers =
          rawdata.map((e) => ServicerModel.fromJson(e)).toList();

      emit(ServicerDataFetchSuccessState(servicers: servicers));
    });
  }
}
