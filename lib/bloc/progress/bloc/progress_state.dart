part of 'progress_bloc.dart';

abstract class ProgressState {}

final class ProgressInitial extends ProgressState {}

 final class AccecptSuccessState extends ProgressState{}
final class AcceptLoadingState extends ProgressState{}
final class RejectedState extends ProgressState{}
final class AcceptErrorState extends ProgressState{
 final String message;

  AcceptErrorState({required this.message});
}
final class RejectErrorState extends ProgressState{
 final String message;

  RejectErrorState({required this.message});


}

final class AcceptedServicerDetailsFetchState extends ProgressState{
  final List<ServicerModel> servicers;

  AcceptedServicerDetailsFetchState({required this.servicers});


}

final class AcceptedServicerDataFetchErrorState extends ProgressState{
  
  final String message;

  AcceptedServicerDataFetchErrorState({required this.message});

}

