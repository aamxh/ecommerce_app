import 'package:flutter/material.dart';

class PasswordResetV extends StatelessWidget {

  const PasswordResetV({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05,),
            Image.asset(
              'assets/images/password.png',
              width: size.width * 0.8,
            ),
            SizedBox(height: size.height * 0.02,),
            Text(
              'Reset your password',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: size.height * 0.01,),
            Text(
              'A password rest link was sent to your email address. Check the link to change your password.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(height: size.height * 0.04,),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width * 0.5, size.height * 0.064),
              ),
              child: const Text('Continue'),
            ),
            SizedBox(height: size.height * 0.01,),
            TextButton(
              onPressed: () {},
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