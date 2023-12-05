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

    final userDetails = await ServicerRepo().getallServicer();

    userDetails.fold((error) {

      emit(ServicerDataFetchErrorState(message: error.message));
    }, (response) {
      final List Rawdata = response['pending'];

      final List<ServicerModel> servicers = Rawdata.map((e) => ServicerModel.fromJson(e)).toList();
   
      emit(ServicerDataFetchSuccessState(servicers: servicers));
    });
  }
}
