import 'package:dartx/dartx.dart';

class CardUtil {
  static String cutCardNumber(String cardNumber) {
    return cardNumber.split('-').lastOrNull ?? cardNumber;
  }
}
