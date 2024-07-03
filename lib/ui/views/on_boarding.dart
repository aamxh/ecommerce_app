import 'package:ecommerce_app/config/constants.dart';
import 'package:ecommerce_app/controllers/on_boarding.dart';
import 'package:ecommerce_app/ui/widgets/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingV extends StatelessWidget {

  const OnBoardingV({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    Get.put(OnBoardingC());
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: Get.find<OnBoardingC>().pageCtrl,
            onPageChanged: (idx) => Get.find<OnBoardingC>().updateIdx(idx),
            children: const [
              PageW(
                image: 'assets/images/searching.png',
                title: 'Find your product',
                subtitle: 'In a world of limitless choices, your product is waiting for you!',
              ),
              PageW(
                image: 'assets/images/shopping.png',
                title: 'Select the payment method',
                subtitle: 'You can choose your payment method among our different options!',
              ),
              PageW(
                image: 'assets/images/delivery.png',
                title: 'Delivery at your door step',
                subtitle: 'From our doorstep to yours with a swift and secure delivery!',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.75, top: size.height * 0.05),
            child: GestureDetector(
              onTap: Get.find<OnBoardingC>().skip,
              child: Text('Skip', style: theme.textTheme.titleSmall,),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.8, left: size.width * 0.1, right: size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SmoothPageIndicator(
                  controller: Get.find<OnBoardingC>().pageCtrl,
                  onDotClicked: Get.find<OnBoardingC>().dotClicked,
                  count: 3,
                  effect: SwapEffect(
                    activeDotColor: theme.primaryColor,
                    dotColor: MyConstants.neutral,
                    dotHeight: 13,
                    dotWidth: 13,
                  ),
                ),
                SizedBox(width: size.width * 0.1,),
                ElevatedButton(
                  onPressed: Get.find<OnBoardingC>().next,
                  style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                  child: const Icon(Icons.arrow_forward_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}