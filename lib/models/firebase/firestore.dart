import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_map/models/Rating%20and%20feedback/RatingAndFeedback_model.dart';

//FOR STORING VALUE USER GIVES INTO THE FIRESTORE
class FirebaseFirestoreService {
  final firestoreInstance =
      FirebaseFirestore.instance.collection('feedbacks and rating');

  Future<void> storeUser(ratingFeedback ratingandfeedback) async {
    final userCollectionRef = firestoreInstance;
    await userCollectionRef
        .doc(ratingandfeedback.id.toString())
        .set(ratingandfeedback.tojson());
  }

  // getting all the value of user rating from firebase
  Stream<List<ratingFeedback>> getAllUserRatingStream() {
    return firestoreInstance.snapshots().map((event) {
      return event.docs.map((e) {
        return ratingFeedback.fromJson(e.data());
      }).toList();
    });
  }
}
