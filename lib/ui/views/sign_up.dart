import 'package:ecommerce_app/ui/views/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpV extends StatelessWidget {

  SignUpV({super.key});

  final _emailCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _numberCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
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
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.abc),
                        labelText: 'Your username'
                      ),
                      controller: _nameCtrl,
                    ),
                    SizedBox(height: size.height * 0.02,),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: 'Your email'
                      ),
                      controller: _emailCtrl,
                    ),
                    SizedBox(height: size.height * 0.02,),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Your phone number'
                      ),
                      controller: _numberCtrl,
                    ),
                    SizedBox(height: size.height * 0.02,),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          labelText: 'Your password'
                      ),
                      controller: _passwordCtrl,
                    ),
                    SizedBox(height: size.height * 0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (val) {},
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
                      onPressed: () => Get.offAll(const MainV()),
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