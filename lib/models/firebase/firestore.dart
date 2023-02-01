import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_map/models/Rating%20and%20feedback/RatingAndFeedback_model.dart';

//FOR STORING VALUE INTO THE FIRESTORE
class FirebaseFirestoreService {
  final firestoreInstance = FirebaseFirestore.instance;
  final userCollectionPath = 'feedbacks and rating';
  Future<void> storeUser(ratingFeedback ratingandfeedback) async {
    final userCollectionRef = firestoreInstance.collection(userCollectionPath);
    await userCollectionRef.doc().set(ratingandfeedback.tojson());
  }
}
