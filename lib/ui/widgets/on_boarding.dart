import 'package:flutter/material.dart';

class PageW extends StatelessWidget {

  const PageW({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            width: size.width * 0.8,
            height: size.height * 0.6,
          ),
          Text(
            title,
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: size.height * 0.025,),
          Text(
            subtitle,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

}