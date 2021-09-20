import 'package:firebase_storage/firebase_storage.dart';

class RecordRepository {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
//upload voice//
  Future<List<Reference>> onUploadComplete() async {
    ListResult listResult =
        await firebaseStorage.ref().child('upload-voice-firebase').list();
    return listResult.items;
  }
}
