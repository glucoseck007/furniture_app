class CreditCard {
  String? holderName;
  String? cardNumber;
  String? expiryDate;
  static List<CreditCard> creditCards = [];

  CreditCard({this.holderName, this.cardNumber, this.expiryDate});

  bool isValidCardNumber(String? cardNumber) {
    // Add your card number validation logic
    return cardNumber != null && cardNumber.length == 9; // Example condition
  }

  bool isValidExpiryDate(String? expiryDate) {
    // Add your expiry date validation logic
    return expiryDate != null && expiryDate.isNotEmpty; // Example condition
  }

  void addCard(CreditCard card) {
    if (!isValidCardNumber(card.cardNumber)) {
      print("Invalid card number");
      return;
    }
    if (!isValidExpiryDate(card.expiryDate)) {
      print("Invalid expiry date");
      return;
    }
    creditCards.add(card);
    print(
        "Card successfully added: ${card.holderName}, ${card.cardNumber}, ${card.expiryDate}");
  }
}
