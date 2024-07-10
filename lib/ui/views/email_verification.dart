import 'package:ecommerce_app/config/authentication.dart';
import 'package:ecommerce_app/ui/views/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationV extends StatefulWidget {

  const EmailVerificationV({super.key});

  @override
  State<EmailVerificationV> createState() => _EmailVerificationVS();
}

class _EmailVerificationVS extends State<EmailVerificationV> {

  final _myAuth = MyAuthentication();

  @override
  void initState() {
    super.initState();
    _myAuth.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.offAll(() => SignInV()),
          icon: const Icon(Icons.clear),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05,),
            Image.asset(
              'assets/images/email.png',
              width: size.width * 0.8,
            ),
            SizedBox(height: size.height * 0.02,),
            Text(
              'Verify your email address',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: size.height * 0.01,),
            Text(
              'A verification link was sent to your email address. Check the link to complete the sign up process.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(height: size.height * 0.03,),
            ElevatedButton(
              onPressed: _myAuth.emailVerified,
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width * 0.5, size.height * 0.064),
              ),
              child: const Text('Continue'),
            ),
            SizedBox(height: size.height * 0.02,),
            TextButton(
              onPressed: _myAuth.sendEmailVerification,
              child: Text(
                'Resend email',
                style: theme.textTheme.bodyLarge!.apply(
                    color: theme.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}