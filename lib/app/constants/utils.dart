class Utils {
  static String rupiahFormatter(int amount) {
    String formatted = amount.toString();

    String result =
        'Rp ${formatted.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) {
      return '${match.group(1)}.';
    })}';

    return result;
  }

  static String getMonthFromInt(int month) {
    switch (month) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maret';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Agustus';
      case 9:
        return 'September';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      case 12:
        return 'Desember';
      default:
        return 'not a valid month';
    }
  }

  static String dateFormatter(String date) {
    DateTime dateTime = DateTime.parse(date);
    return '${dateTime.day} ${getMonthFromInt(dateTime.month)} ${dateTime.year}, ${dateTime.hour}:${dateTime.minute}';
  }
}
