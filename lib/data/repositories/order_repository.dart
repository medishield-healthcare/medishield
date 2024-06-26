import 'package:get/get.dart';
import 'package:medishield/features/personalization/models/address_model.dart';
import 'package:medishield/utils/http/http_client.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  // create order to server
  createOrder(
    String paymentId,
    String orderId,
    String paymentSignature,
    int amount,
    int shipping,
    AddressModel shippingAddress,
    int msc,
    String? couponId,
    int? coDiscount,
  ) async {
    try {
      final res = THttpHelper.post('api/user/cart/create-order', {
        'paymentId': paymentId,
        'orderId': orderId,
        'paymentSignature': paymentSignature,
        'amount': amount,
        'shipping': shipping,
        'shippingAddress': shippingAddress,
        'msc': msc,
        'couponId': couponId ?? '',
        'disc': coDiscount ?? 0,
      });
      return res;
    } catch (e) {
      rethrow;
    }
  }

  // fetch orders from server
  fetchOrders() async {
    try {
      final res = await THttpHelper.get('api/user/get-orders');
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
