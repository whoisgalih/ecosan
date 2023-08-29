// create repository from trash history model

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:ecosan/app/constants/firebase_constants.dart';
import 'package:ecosan/app/models/trashHistory/trash_history_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TrashHistoryRepository {
  User? user = auth.currentUser;

  CollectionReference get trashHistoryCollection =>
      firestore.collection('users').doc(user!.uid).collection('trashHistory');

  Future<DocumentReference> add(TrashHistory trashHistory) {
    return trashHistoryCollection.add(trashHistory.toJson());
  }

  Future<void> update(TrashHistory trashHistory) async {
    await trashHistoryCollection
        .doc(trashHistory.id)
        .update(trashHistory.toJson());
  }

  Future<void> delete(TrashHistory trashHistory) async {
    await trashHistoryCollection.doc(trashHistory.id).delete();
  }

  Future<List<TrashHistory>> getAll() async {
    final querySnapshot = await trashHistoryCollection.get();
    return querySnapshot.docs
        .map((doc) => TrashHistory.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}

TrashHistoryRepository trashHistoryRepository = TrashHistoryRepository();
