class Helper {
  String getFormattedAmount(String amount) {
    if (amount.contains(".")) {
      RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
      amount = amount.toString().replaceAll(regex, '');
      String formatted = amount.replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      return formatted;
    } else {
      String formatted = amount.replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      return formatted;
    }
  }

  String removeTrailingZero(String value) {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    value = value.toString().replaceAll(regex, '');
    return value;
  }
}
