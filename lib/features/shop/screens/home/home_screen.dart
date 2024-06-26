import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medishield/common/widgets/custom_shapes/containers/t_primary_header_container.dart';
import 'package:medishield/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:medishield/common/widgets/shimmers/product_shimmer.dart';
import 'package:medishield/features/shop/controllers/banner_controller.dart';
import 'package:medishield/features/shop/controllers/home_controller.dart';
import 'package:medishield/features/shop/controllers/product_controller.dart';
import 'package:medishield/features/shop/screens/categories/categories.dart';
import 'package:medishield/features/shop/screens/chat/chat.dart';
import 'package:medishield/utils/constants/colors.dart';
import 'package:medishield/utils/constants/sizes.dart';
import 'package:medishield/utils/device/device_utility.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/text/t_section_heading.dart';
import 'widgets/t_home_app_bar.dart';
import 'widgets/t_home_categories.dart';
import 'widgets/t_promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final controller = Get.put(ProductController());
    final bannerController = Get.put(BannerController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: TDeviceUtils.getAppBarHeight() + 30,
        flexibleSpace: const TPrimaryHeaderContainer(
          child: Column(
            children: [
              THomeAppBar(),
              SizedBox(height: TSizes.spaceBtwSections / 1.5),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: TDeviceUtils.getAppBarHeight() + 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TSectionHeading(
                      title: 'Popular Categories',
                      buttonTitle: 'View All',
                      showButton: true,
                      onButtonPressed: () => Get.to(
                        () => const CategoiesScreen(),
                      ),
                    ),
                    const THomeCategories(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const TPromoSlider(
                      skipCount: 0,
                      takeCount: 6,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSectionHeading(
                      title: 'Featured Products',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const ProductShimmer();
                        }
                        if (controller.FeaturedProducts.isEmpty) {
                          return const Center(
                            child: Text('0 Products Available Right Now'),
                          );
                        }
                        return GridLayout(
                          itemBuilder: (_, index) => ProductCardVertical(
                            product: controller.FeaturedProducts[index],
                          ),
                          itemCount: controller.FeaturedProducts.length,
                        );
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TPromoSlider(
                      skipCount: 6,
                      takeCount: (bannerController.totalBanners.value - 6) > 6
                          ? 6
                          : bannerController.totalBanners.value - 6,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSectionHeading(
                      title: 'Endocraft Products',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const ProductShimmer();
                        }
                        if (controller.Endodontics.isEmpty) {
                          return const Center(
                            child: Text('No data found'),
                          );
                        }
                        return GridLayout(
                          itemBuilder: (_, index) => ProductCardVertical(
                            product: controller.Endodontics[index],
                          ),
                          itemCount: controller.Endodontics.length,
                        );
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    ///

                    const TSectionHeading(
                      title: 'Medishield Products',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const ProductShimmer();
                        }
                        if (controller.Orthodontics.isEmpty) {
                          return const Center(
                            child: Text('No data found'),
                          );
                        }
                        return GridLayout(
                          itemBuilder: (_, index) => ProductCardVertical(
                            product: controller.Orthodontics[index],
                          ),
                          itemCount: controller.Orthodontics.length,
                        );
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    ///
                    TPromoSlider(
                      skipCount: 6 * 2,
                      // take all remaining items
                      takeCount: bannerController.totalBanners.value - (6 * 2),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSectionHeading(
                      title: 'Clinician\'s Choice Products',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const ProductShimmer();
                        }
                        if (controller.Instruments.isEmpty) {
                          return const Center(
                            child: Text('0 Products Available Right Now'),
                          );
                        }
                        return GridLayout(
                          itemBuilder: (_, index) => ProductCardVertical(
                            product: controller.Instruments[index],
                          ),
                          itemCount: controller.Instruments.length,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () {
          Get.to(() => const ChatScreen(),
              transition: Transition.cupertinoDialog,
              curve: Curves.easeInOutCubic);
        },
        child: const Icon(
          Iconsax.message,
          color: Colors.white,
        ),
      ),
    );
  }
}
