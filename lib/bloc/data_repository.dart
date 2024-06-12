import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  Future<void> submitFormData(Map<String, dynamic> data, String collection,
      String subCollection) async {
    //Generating the document ID for the schedule in the user
    String documentId = FirebaseFirestore.instance
        .collection('user')
        .doc('MwwkLsi06OM9TojOt7hVxdf9NPf1')
        .collection(subCollection)
        .doc()
        .id;

    // Add data to the user's subcollection
    await FirebaseFirestore.instance
        .collection('user')
        .doc('MwwkLsi06OM9TojOt7hVxdf9NPf1')
        .collection(subCollection)
        .doc(documentId)
        .set(data);

    // Add same data to the schedules collection
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .set(data);
  }
}
