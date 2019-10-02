import 'dart:io';
import 'package:devfest19/blocs/gallery/gallery_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

abstract class FirebaseRepository {
  Stream<List<Gallery>> images();
}

class FirebaseGalleryRepository extends FirebaseRepository {
  final galleryCollection = Firestore.instance.collection('gallery-images');

  @override
  Stream<List<Gallery>> images() {
    return galleryCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Gallery.fromData(GalleryData.fromSnapshot(doc)))
          .toList();
    });
  }
}

class GalleryRepository {
  final ImageSource source;
  String urlLink;

  GalleryRepository({this.source});

  Future<void> uploadToCloud() async {
    File imageToUpload = await ImagePicker.pickImage(source: this.source);

    final StorageReference reference =  FirebaseStorage.instance.ref().child("Gallery");
    var uuid = Uuid().v1();
    StorageUploadTask uploadTask =
        reference.child(uuid).putFile(imageToUpload);

    // getting the uploaded image network url
    var downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    urlLink = downloadUrl.toString();
    print(urlLink);
    uploadImageUrl(urlLink);
  }

  uploadImageUrl(url) async {
    // do the actual storage
    DocumentReference collectionReference = await Firestore.instance
        .collection("gallery-images")
        .add({'images': url});
    print(collectionReference.documentID);
  }
}
