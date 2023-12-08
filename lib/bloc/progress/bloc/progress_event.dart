part of 'progress_bloc.dart';


abstract class ProgressEvent {}

class ServicerAcceptedEvent extends ProgressEvent{
final String id;

  ServicerAcceptedEvent({required this.id});

}

class ServicerRejectedEvent extends ProgressEvent{
  final String id;

  ServicerRejectedEvent({required this.id});
}

class AcceptedUserFetchEvent extends ProgressEvent{}
