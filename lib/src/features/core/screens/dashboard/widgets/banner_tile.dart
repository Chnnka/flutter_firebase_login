import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';

class BannerTile extends StatelessWidget {
  const BannerTile({
    super.key,
    required this.isDark,
    required this.textTheme,
  });

  final bool isDark;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isDark ? Colors.black87 : cCardBgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.bookmark_add, size: 30.0),
                  ),
                ),
                Flexible(
                  child: Image(
                    image: AssetImage(cOnBoardingImage1),
                    height: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              'Banner Title 1',
              style: textTheme.headlineSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Text banner subtitle 1',
              style: textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
