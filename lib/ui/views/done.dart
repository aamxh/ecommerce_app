import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/ui/views/main.dart';

class DoneV extends StatelessWidget {

  const DoneV({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05,),
            Image.asset(
              'assets/images/done.png',
              width: size.width * 0.8,
            ),
            SizedBox(height: size.height * 0.02,),
            Text(
              'You\'ve completed the sign-up process. Ready to do some shopping?',
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(height: size.height * 0.02,),
            ElevatedButton(
              onPressed: () => Get.offAll(() => const MainV()),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width * 0.5, size.height * 0.064),
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

}