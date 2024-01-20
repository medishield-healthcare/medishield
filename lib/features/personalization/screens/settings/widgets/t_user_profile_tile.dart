import 'package:flutter/material.dart';
import 'package:medishield/common/widgets/images/t_circular_image.dart';
import 'package:medishield/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        height: 50,
        width: 50,
      ),
      title: Text(
        'John Doe',
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: Colors.white,
            ),
      ),
      subtitle: Text(
        'kaifmohd2014@gmail',
        style: Theme.of(context).textTheme.labelMedium!.apply(
              color: Colors.white,
            ),
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}