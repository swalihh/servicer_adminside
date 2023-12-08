import 'dart:async';
import 'package:adminservice/models/servicermodel.dart';
import 'package:adminservice/repositories/servecerdata.dart';
import 'package:adminservice/resources/appurls/servicerurls.dart';
import 'package:bloc/bloc.dart';
part 'progress_event.dart';
part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc() : super(ProgressInitial()) {
    on<ServicerRejectedEvent>(rejectServicer);
    on<ServicerAcceptedEvent>(acceptServicer);
    on<AcceptedUserFetchEvent>(acceptedServicers);
  }

  FutureOr<void> rejectServicer(
      ServicerRejectedEvent event, Emitter<ProgressState> emit) async {
//    emit(AcceptLoadingState());
    String userid = event.id;
    final data =
        await ServicerRepo().rejectServicer(AppUrl.rejectServicer, userid);
    data.fold((error) {
      emit(RejectErrorState(message: error.message));
    }, (responce) {
      emit(RejectedState());
    });
  }

  FutureOr<void> acceptServicer(
      ServicerAcceptedEvent event, Emitter<ProgressState> emit) async {
    String userid = event.id;
    final data =
        await ServicerRepo().acceptServicer(AppUrl.acceptservicer, userid);

    data.fold((error) {
      emit(AcceptErrorState(message: error.message));
    }, (response) {
      emit(AccecptSuccessState());
    });
  }

  FutureOr<void> acceptedServicers(
      AcceptedUserFetchEvent event, Emitter<ProgressState> emit) async {
    final data = await ServicerRepo().getAcceptedSevicer();
    data.fold((error) {
      emit(AcceptedServicerDataFetchErrorState(message: error.message));
    }, (response) {
      final List rawdata= response['accepted'] ;
      final List<ServicerModel> acceptedlist=rawdata.map((e) => ServicerModel.fromJson(e)).toList();  
      print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      print(acceptedlist);

      emit(AcceptedServicerDetailsFetchState(servicers:acceptedlist ));
    });
  }
}
