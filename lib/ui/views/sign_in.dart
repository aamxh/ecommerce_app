import 'package:ecommerce_app/ui/views/password_reset.dart';
import 'package:ecommerce_app/ui/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/config/constants.dart';
import 'package:get/get.dart';

class SignInV extends StatelessWidget {

  SignInV({super.key});

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.1,),
              Image.asset(
                theme.brightness == Brightness.light ?
                MyConstants.lightLogoP :
                MyConstants.darkLogoP,
                width: size.width * 0.2,
              ),
              SizedBox(height: size.height * 0.03,),
              Text(
                'Welcome! Here you can sign in to your account, or create a new one.',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.03,),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailCtrl,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Your email',
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    TextFormField(
                      controller: _passwordCtrl,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: 'Your password',
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: true,
                              onChanged: (val) {},
                            ),
                            Text(
                              'Remember me',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Get.to(const PasswordResetV()),
                          child: Text(
                            'Forgot password?',
                            style: theme.textTheme.bodyLarge!.apply(
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03,),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * 0.5, size.height * 0.064),
                      ),
                      child: const Text('Sign in'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account?',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Get.to(SignUpV()),
                    child: Text(
                      'Sign up',
                      style: theme.textTheme.bodyLarge!.apply(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02,),
              Text(
                'Or sign in with: ',
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: size.height * 0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      icon: Image.asset(
                        'assets/logos/google.webp',
                        width: 40,
                        height: 40,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      icon: Image.asset(
                        'assets/logos/facebook.png',
                        width: 40,
                        height: 40,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}