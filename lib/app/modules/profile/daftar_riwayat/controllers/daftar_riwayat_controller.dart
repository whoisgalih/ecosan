import 'package:ecosan/app/models/transaction/transaction_model.dart';
import 'package:ecosan/app/repository/transaction_repository.dart';
import 'package:get/get.dart';

class DaftarRiwayatController extends GetxController {
  final statusValue = 'Semua Status'.obs;
  final layananValue = 'Semua Layanan'.obs;
  final tanggalValue = 'Semua Tanggal'.obs;
  Rx<List<Transaction>> transactions = Rx<List<Transaction>>([]);
  TransactionRepository transactionRepository = TransactionRepository();
  @override
  void onInit() async {
    super.onInit();
    getTransactions();
  }

  Future<void> getTransactions() async {
    final result = await transactionRepository.get();
    transactions.value = result;
  }
}
