part of 'servicer_bloc.dart';


abstract class ServicerState {}

final class ServicerInitial extends ServicerState {}
final class ServicerDataFetchSuccessState extends ServicerState{
final List<ServicerModel> servicers;
 ServicerDataFetchSuccessState({required this.servicers});

}
final class ServicerDataLoadingState extends ServicerState{}
final class ServicerDataFetchFailerState extends ServicerState{}
final class ServicerDataFetchErrorState extends ServicerState{
  
  final String message;

  ServicerDataFetchErrorState({required this.message});

}


