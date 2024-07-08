import 'package:trial_and_error/topics/provider/catalog/models/item.dart';
import 'package:trial_and_error/topics/provider/catalog/state_managment/cart_notifier.dart';
import 'package:test/test.dart';

void main() {
  test('adding item increases total cost', () {
    final cart = CartNotifier();
    final startingPrice = cart.totalPrice;
    var i = 0;
    cart.addListener(() {
      expect(cart.totalPrice, greaterThan(startingPrice));
      i++;
    });
    cart.add(Item(name: 'Book'));
    expect(i, 1);
  });
}
