import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosan/app/constants/firebase_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecosan/app/models/transaction/transaction_model.dart' as model;

class TransactionRepository {
  User? user = auth.currentUser;
  CollectionReference get transactionCollection =>
      firestore.collection('users').doc(user!.uid).collection('transactions');

  // add
  Future<DocumentReference> add(model.Transaction transaction) async {
    return await transactionCollection.add(transaction.toJson());
  }

  // get all
  Future<List<model.Transaction>> get() async {
    final querySnapshot = await transactionCollection.get();
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return model.Transaction.fromJson(data);
    }).toList();
  }

  // is exist
  Future<bool> isExist() async {
    final querySnapshot = await transactionCollection.get();
    print(querySnapshot.docs.isNotEmpty);
    return querySnapshot.docs.isNotEmpty;
  }
}

TransactionRepository transactionRepository = TransactionRepository();
