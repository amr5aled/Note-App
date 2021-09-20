part of 'record_cubit.dart';

abstract class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object> get props => [];
}

class RecordInitial extends RecordState {}

class RecordGetRecordLoading extends RecordState {}

class RecordGetRecordLoaded extends RecordState {}

class RecordGetRecordError extends RecordState {
  final String error;

  RecordGetRecordError(this.error);
}
class RecordAddRecordLoading extends RecordState {}

class RecordAddRecordLoaded extends RecordState {}

class RecordAddRecordError extends RecordState {
  final String error;

  RecordAddRecordError(this.error);
}
class RecordDeleteRecordLoading extends RecordState {}

class RecordDeleteRecordLoaded extends RecordState {}

class RecordDeleteRecordError extends RecordState {
  final String error;

  RecordDeleteRecordError(this.error);
}