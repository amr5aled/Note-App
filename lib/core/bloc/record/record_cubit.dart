
// ignore_for_file: avoid_print

import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/repository/record_repository.dart';


part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  final RecordRepository _recordRepository;
  RecordCubit(this._recordRepository) : super(RecordInitial());
  static RecordCubit get(BuildContext context) => BlocProvider.of(context);
  //get all voices//
  List<Reference> references = [];
  void getVoices() {
    emit(RecordGetRecordLoading());
    _recordRepository.onUploadComplete().then((value) {
      print(value);
      references = value;
      emit(RecordGetRecordLoaded());
    }).catchError((error) {
      emit(RecordGetRecordError(error));
    });
  }

  bool isUploading = false;

  Future<void> onFileUploadButtonPressed({String? filePath}) async {
    emit(RecordAddRecordLoading());
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    isUploading = true;

    try {
      await firebaseStorage
          .ref('upload-voice-firebase')
          .child(
              filePath!.substring(filePath.lastIndexOf('/'), filePath.length))
          .putFile(File(filePath));
      getVoices();
      emit(RecordAddRecordLoaded());
    } catch (error) {
      print('Error occured while uplaoding to Firebase ${error.toString()}');
      emit(RecordAddRecordError(error.toString()));
    } finally {
      isUploading = false;
    }
  }

  void deleteRecord({String? url}) {
    emit(RecordDeleteRecordLoading());
    FirebaseStorage.instance.refFromURL(url!).delete().then((value) {
      getVoices();
       emit(RecordDeleteRecordLoaded());
    }).catchError((error) {
       emit(RecordDeleteRecordError(error));
    });
  }
}
