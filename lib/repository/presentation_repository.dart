import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_assembly/models/presentation.dart';

class PresentationRepository {
  static const collectionName = 'presentations';

  Future<void> update(Presentation item) async {
    FirebaseFirestore.instance
        .collection(collectionName)
        .doc(item.id)
        .update(item.firestoreData);
    return;
  }
}
