import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';


class ImageService {
  final FirebaseStorage _storage;

  ImageService(this._storage);

  Future getImageByRef({@required refa}) async{
    // no need of the file extension, the name will do fine.
    //   var url = ();
    return  await _storage.ref(refa).getDownloadURL();
  }


}


