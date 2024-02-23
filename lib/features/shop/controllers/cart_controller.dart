import 'package:get/get.dart';
import 'package:medishield/data/repositories/authentication_repository.dart';
import 'package:medishield/data/repositories/cart_repository.dart';
import 'package:medishield/features/authentication/screens/login/login.dart';
import 'package:medishield/features/shop/models/cart_model.dart';
import 'package:medishield/utils/helpers/helper_functions.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  final cartRepo = Get.put(CartRepository());
  final auth = AuthenticationRepository.instance;
  final userCart = CartModel(
    id: '',
    products: [],
    cartTotal: 0,
    orderby: '',
  ).obs;
  var total = 0.obs;
  var grandTotal = 0.obs;
  var counter = 1.obs;
  var discount = 0.obs;
  var useMediShieldCoins = false.obs;

  @override
  void onInit() async {
    if (auth.deviceStorage.read('guest') == true ||
        auth.deviceStorage.read('token') == null) {
      return;
    }
    super.onInit();
    await fetchCartItems();
  }

  handleCheckbox(bool value) {
    useMediShieldCoins.value = value;
    if (value == true) {
      discount.value = 100;
    } else {
      discount.value = 0;
    }
    grandTotal.value = userCart.value.cartTotal + 150 - discount.value;
  }

  increaseCount() {
    if (counter.value == 5) {
      return;
    }
    counter.value++;
  }

  decreaseCount() {
    if (counter.value == 1) {
      return;
    }
    counter.value--;
  }

  fetchCartItems() async {
    try {
      if (auth.deviceStorage.read('guest') == true ||
          auth.deviceStorage.read('token') == null) {
        return;
      }
      final res = await cartRepo.fetchCartItems();
      if (res['data'] == null) {
        userCart.value = CartModel(
          id: '',
          products: [],
          cartTotal: 0,
          orderby: '',
        );
        return;
      }
      userCart.value = CartModel.fromJson(res['data']);
      total.value = userCart.value.cartTotal;
      grandTotal.value = userCart.value.cartTotal + 150;
    } catch (e) {
      rethrow;
    }
  }

  void addToCart(
      {required String product,
      required int count,
      required int price,
      String v = ''}) async {
    try {
      if (auth.deviceStorage.read('token') == null) {
        Get.offAll(() => const LoginScreen());
        return;
      }
      final res = await cartRepo.addtocart(
        prodId: product,
        count: count,
        price: price,
        v: v,
      );
      userCart.value = CartModel.fromJson(res);
      total.value = userCart.value.cartTotal;
      grandTotal.value = userCart.value.cartTotal + 150;
      THelperFunctions.showSnackBar('Cart updated');
      counter.value = 1;
      update();
    } catch (e) {
      rethrow;
    }
  }

  void removeFromCart(
      {required String product,
      required int count,
      required int price,
      String v = ''}) async {
    try {
      await cartRepo.removeFromCart(
        prodId: product,
        v: v,
      );
      THelperFunctions.showSnackBar('Removed from cart');
      await fetchCartItems();
      update();
      return;
    } catch (e) {
      rethrow;
    }
  }

  void clearCart() async {
    try {
      await cartRepo.clearCart();
      counter.value = 1;
      await fetchCartItems();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onClose() {
    userCart.close();
    super.onClose();
  }
}
