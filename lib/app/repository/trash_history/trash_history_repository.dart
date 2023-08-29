// create repository from trash history model

import 'package:cloud_firestore/cloud_firestore.dart';
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

  // get by id
  Future<TrashHistory> get(String id) async {
    final doc = await trashHistoryCollection.doc(id).get();
    return TrashHistory.fromJson(doc.data() as Map<String, dynamic>);
  }

  Future<void> update(String id, Map<String, dynamic> data) async {
    await trashHistoryCollection.doc(id).update(data);
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
