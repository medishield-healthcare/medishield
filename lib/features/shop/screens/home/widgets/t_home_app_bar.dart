import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medishield/common/widgets/appbar/appbar.dart';
import 'package:medishield/common/widgets/loaders/custom_shimmer.dart';
import 'package:medishield/common/widgets/products/cart/t_cart_counter_icon.dart';
import 'package:medishield/features/shop/controllers/user_controller.dart';
import 'package:medishield/features/shop/screens/Search/search.dart';
import 'package:medishield/features/shop/screens/cart/cart.dart';
import 'package:medishield/utils/constants/colors.dart';
import 'package:medishield/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          TTexts.homeAppbarTitle,
          style: Theme.of(context).textTheme.labelMedium!.apply(
                color: TColors.grey,
              ),
        ),
        Obx(() {
          if (controller.userLoading.value) {
            return const CustomShimmer(height: 15, width: 80);
          } else {
            return Text(
              controller.user.value.fullName,
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: TColors.white,
                  ),
            );
          }
        }),
      ]),
      actions: [
        IconButton(
            onPressed: () => Get.to(() => const SearchScreen()),
            icon: const Icon(
              Iconsax.search_normal,
              color: TColors.white,
            )),
        TCartCounterIcon(
          iconColor: TColors.white,
          onPressed: () => Get.to(
            () => const CartScreen(),
          ),
        )
      ],
    );
  }
}
