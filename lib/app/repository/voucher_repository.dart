import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosan/app/constants/firebase_constants.dart';
import 'package:ecosan/app/models/voucher/voucher.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VoucherRepository {
  User? user = auth.currentUser;

  CollectionReference get transactionCollection =>
      firestore.collection('users').doc(user!.uid).collection('vouchers');

  // add
  Future<DocumentReference> add(Voucher voucher) async {
    return await transactionCollection.add(voucher.toJson());
  }

  // get all
  Future<List<Voucher>> get() async {
    final querySnapshot = await transactionCollection.get();
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return Voucher.fromJson(data);
    }).toList();
  }

  Future<void> useVoucher(String id) async {
    await transactionCollection
        .doc(id)
        .update({'usedDate': DateTime.now().toIso8601String()});
  }
}
