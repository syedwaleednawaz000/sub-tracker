import 'package:flutter/material.dart';
import '../../../utils/app_Images.dart';
import '../../../utils/my_size.dart';


class CustomAppBar extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final String text;
  const CustomAppBar({super.key, required this.icon, required this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: MySize.size20),
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading:GestureDetector(
            onTap:onTap,
            child: Image.asset(AppImages.backArrow,color: const Color(0XFFA2A2B5),)),
        title:  Text(text,style: TextStyle(color: const Color(0XFFA2A2B5),fontSize: MySize.size16, fontWeight: FontWeight.w400),),
      ),
    );
  }
}
