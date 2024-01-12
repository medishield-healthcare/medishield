import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medihealth/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:medihealth/utils/constants/colors.dart';
import 'package:medihealth/utils/constants/sizes.dart';
import 'package:medihealth/utils/device/device_utility.dart';
import 'package:medihealth/utils/helpers/helper_functions.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? TColors.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
