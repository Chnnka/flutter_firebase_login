import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';

import 'package:flutter_firebase_login/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:get/get.dart';

class CFadeInAnimation extends StatelessWidget {
  CFadeInAnimation({
    Key? key,
    required this.durationInMs,
    required this.child,
    this.animate,
  }) : super(key: key);

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final CAnimatedPosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: controller.animate.value ? animate!.topAfter : animate!.topBefore,
        left:
            controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
        bottom: controller.animate.value
            ? animate!.bottomAfter
            : animate!.bottomBefore,
        right: controller.animate.value
            ? animate!.rightAfter
            : animate!.rightBefore,
        child: AnimatedOpacity(
          opacity: controller.animate.value ? 1 : 0,
          duration: Duration(milliseconds: durationInMs),
          child: child,
        ),
      ),
    );
  }
}
