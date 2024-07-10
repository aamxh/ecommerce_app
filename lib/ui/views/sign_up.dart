import 'package:ecommerce_app/config/constants.dart';
import 'package:ecommerce_app/config/helpers.dart';
import 'package:ecommerce_app/config/authentication.dart';
import 'package:ecommerce_app/controllers/authentication.dart';
import 'package:ecommerce_app/ui/views/done.dart';
import 'package:ecommerce_app/ui/views/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpV extends StatelessWidget {

  SignUpV({super.key});

  final _myAuth = MyAuthentication();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            MyAuthentication.passwordCtrl.clear();
            MyAuthentication.phoneCtrl.clear();
            MyAuthentication.emailCtrl.clear();
            MyAuthentication.nameCtrl.clear();
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Text(
                'Let\'s create a new account.',
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: size.height * 0.03,),
              Form(
                key: MyAuthentication.signUpKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.abc),
                        labelText: 'Your username'
                      ),
                      controller: MyAuthentication.nameCtrl,
                      validator: MyHelpers.validateName,
                    ),
                    SizedBox(height: size.height * 0.02,),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Your email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: MyAuthentication.emailCtrl,
                      validator: MyHelpers.validateEmail,
                    ),
                    SizedBox(height: size.height * 0.02,),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: 'Your phone number',
                      ),
                      keyboardType: TextInputType.phone,
                      controller: MyAuthentication.phoneCtrl,
                      validator: MyHelpers.validatePhone,
                    ),
                    SizedBox(height: size.height * 0.02,),
                    GetBuilder<AuthenticationC>(
                      init: AuthenticationC(),
                      builder: (ctrl) => TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
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
                          labelText: 'Your password',
                        ),
                        controller: MyAuthentication.passwordCtrl,
                        validator: MyHelpers.validatePassword,
                        obscureText: ctrl.isPasswordHidden,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GetBuilder(
                          init: AuthenticationC(),
                          builder: (ctrl) => Checkbox(
                            value: ctrl.accepted,
                            onChanged: (val) => ctrl.changeAccepted(val!),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree to ',
                                style: theme.textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: 'Terms of use ',
                                style: theme.textTheme.bodyMedium!.apply(
                                    color: theme.primaryColor,
                                ),
                              ),
                              TextSpan(
                                text: 'and ',
                                style: theme.textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: 'Privacy policy',
                                style: theme.textTheme.bodyMedium!.apply(
                                    color: theme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02,),
                    ElevatedButton(
                      onPressed: Get.find<MyAuthentication>().signUp,
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * 0.5, size.height * 0.064),
                      ),
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                'Or sign up with:',
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: size.height * 0.03),
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
                      onPressed: () async {
                        final result = await _myAuth.signInWithGoogle();
                        if (result) {
                          Get.offAll(() => const DoneV());
                        }
                      },
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