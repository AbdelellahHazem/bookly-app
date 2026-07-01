import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errmessege;
  const CustomErrorWidget({super.key, required this.errmessege});

  @override
  Widget build(BuildContext context) {
    return Text(errmessege, style: Styles.textstyle18);
  }
}
