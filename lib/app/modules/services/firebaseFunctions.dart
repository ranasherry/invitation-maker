import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirestoreService _instance =
      FirestoreService._internal(); // Singleton instance

  factory FirestoreService() {
    // Factory constructor for access
    return _instance;
  }
  FirestoreService._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionPath = 'premiumUsers'; // Customizable collection path
  final String _historySubcollectionPath =
      'history'; // Customizable subcollection path

  String UserID = "temp";

  /// Creates a new user document with an empty history list, generationCount of 0, and tokensConsumed of 0.
  Future<void> createUser({required String uid}) async {
    final userExists = await _doesUserExist(uid);

    if (!userExists) {
      await _firestore.collection(_collectionPath).doc(uid).set({
        'generationCount': 0,
        'tokensConsumed': 0,
      });
      UserID =
          uid; // Assuming this is for internal tracking (avoid storing in client-side code)

      print(
          'User created successfully: $uid'); // Optional logging for debugging
    } else {
      print(
          'User already exists: $uid'); // Optional logging for informative messages
    }
    // UserID = uid;
  }

  Future<bool> _doesUserExist(String uid) async {
    final docRef = _firestore.collection(_collectionPath).doc(uid);
    final snapshot = await docRef.get();
    return snapshot.exists;
  }

  /// Retrieves a user document by its UID.
  // Future<PremiumUser?> getUser({required String uid}) async {
  //   final docSnapshot =
  //       await _firestore.collection(_collectionPath).doc(uid).get();
  //   return docSnapshot.exists
  //       ? PremiumUser.fromMap(docSnapshot.data()!, uid)
  //       : null;
  // }

  // /// Increments the generationCount for the user with the given UID.
  // Future<void> increaseGenerationCount({
  //   required String uid,
  // }) async {
  //   await _firestore.runTransaction((transaction) async {
  //     final docRef = _firestore.collection(_collectionPath).doc(uid);
  //     final docSnapshot = await transaction.get(docRef);
  //     if (docSnapshot.exists) {
  //       final user = PremiumUser.fromMap(docSnapshot.data()!, uid);
  //       transaction
  //           .update(docRef, {'generationCount': user.generationCount + 1});
  //     }
  //   });
  // }

  // /// Increments the tokensConsumed for the user with the given UID.
  // Future<void> increaseTokensConsumed(
  //     {required String uid, required int increament}) async {
  //   await _firestore.runTransaction((transaction) async {
  //     final docRef = _firestore.collection(_collectionPath).doc(uid);
  //     final docSnapshot = await transaction.get(docRef);
  //     if (docSnapshot.exists) {
  //       final user = PremiumUser.fromMap(docSnapshot.data()!, uid);
  //       transaction.update(
  //           docRef, {'tokensConsumed': user.tokensConsumed + increament});
  //     }
  //   });
  // }

  // // Add other necessary functions here, such as updating history list, etc.

  // //? History Items
  // /// Creates a new history item for the user with the given UID, with a unique ID based on current time in milliseconds since epoch.
  // Future<void> addHistoryItem(String uid, SlideItem item) async {
  //   final docRef = _firestore
  //       .collection(_collectionPath)
  //       .doc(uid)
  //       .collection(_historySubcollectionPath)
  //       .doc(item.timestamp.toString());
  //   await docRef.set(item.toMap());
  // }

  // /// Retrieves a list of history items for the user with the given UID.
  // Future<List<SlideItem>> getHistory(String uid) async {
  //   final querySnapshot = await _firestore
  //       .collection(_collectionPath)
  //       .doc(uid)
  //       .collection(_historySubcollectionPath)
  //       .get();
  //   return querySnapshot.docs
  //       .map((docSnapshot) => SlideItem.fromMap(docSnapshot.data()!))
  //       .toList();
  // }
}
