import 'package:flutter/material.dart';
import 'package:medishield/common/widgets/images/t_rounded_image.dart';
import 'package:medishield/features/shop/controllers/order_controller.dart';
import 'package:medishield/utils/constants/colors.dart';

import 'package:medishield/utils/constants/sizes.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({super.key, required this.oindex});

  final int oindex;

  @override
  Widget build(BuildContext context) {
    final controller = OrderController.instance;
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //image
                  children: [
                    TRoundedImage(
                      isNetworkImage: true,
                      imageUrl:
                          'https://images.dentalkart.com/media/catalog/product/${controller.orderData[oindex].products[index].product.thumbnailUrl}',
                      height: 80,
                      width: 80,
                      padding: const EdgeInsets.all(TSizes.xs),
                      backgroundColor: TColors.grey,
                    ),
                    // brand
                    // name
                    const SizedBox(width: TSizes.spaceBtwItems / 2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              controller.orderData[oindex].products[index]
                                  .product.name
                                  .split(' ')[0],
                              style: Theme.of(context).textTheme.labelMedium),
                          Text(
                              controller.orderData[oindex].products[index]
                                          .variant !=
                                      ''
                                  ? controller.orderData[oindex].products[index]
                                      .product.childProducts
                                      .map((e) => e.sku ==
                                              controller.orderData[oindex]
                                                  .products[index].variant
                                          ? e.name
                                          : '')
                                      .toString()
                                      .replaceAll('(', '')
                                      .replaceAll(')', '')
                                      .replaceAll(',', '')
                                      .trim()
                                  : controller.orderData[oindex].products[index]
                                      .product.name,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                          Row(
                            children: [
                              const Spacer(),
                              Text(
                                '₹ ${controller.orderData[oindex].products[index].price}',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // price
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                // quantity
              ],
            ),
        separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
        itemCount: controller.orderData[oindex].products.length);
  }
}