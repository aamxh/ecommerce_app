import 'package:ecommerce_app/controllers/authentication.dart';
import 'package:ecommerce_app/config/helpers.dart';
import 'package:ecommerce_app/ui/views/password_reset.dart';
import 'package:ecommerce_app/ui/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/config/constants.dart';
import 'package:get/get.dart';

class SignInV extends StatelessWidget {

  const SignInV({super.key});

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
                key: MyAuthentication.signInKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: MyAuthentication.emailCtrl,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Your email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: MyHelpers.validateEmail,
                    ),
                    SizedBox(height: size.height * 0.02,),
                    GetBuilder(
                      init: MyAuthentication(),
                      builder: (ctrl) => TextFormField(
                        controller: MyAuthentication.passwordCtrl,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          labelText: 'Your password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              if (ctrl.isPasswordHidden) {
                                ctrl.showPassword();
                              } else {
                                ctrl.hidePassword();
                              }
                            },
                            child: Icon(
                              Icons.remove_red_eye_outlined,
                              color: ctrl.isPasswordHidden ?
                              MyConstants.primaryColor :
                              MyConstants.neutral,
                            ),
                          ),
                        ),
                        obscureText: ctrl.isPasswordHidden,
                        validator: MyHelpers.validatePassword,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            GetBuilder(
                              init: MyAuthentication(),
                              builder: (ctrl) => Checkbox(
                                value: ctrl.rememberMe,
                                onChanged: ctrl.changeRememberMe,
                              ),
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
                      onPressed: Get.find<MyAuthentication>().signIn,
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
                    onTap: () {
                      MyAuthentication.emailCtrl.clear();
                      MyAuthentication.passwordCtrl.clear();
                      Get.to(const SignUpV());
                    },
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
                      onPressed: Get.find<MyAuthentication>().signInWithGoogle,
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