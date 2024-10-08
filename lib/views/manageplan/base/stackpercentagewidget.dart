import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';

class StackPercentageWidget extends StatelessWidget {
  String percentValue ;
   StackPercentageWidget({required this.percentValue,super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      left: MySize.scaleFactorHeight * 170,
      child: Container(
         margin:EdgeInsets.symmetric(vertical: MySize.size4) ,
        width: MySize.scaleFactorWidth * 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MySize.size12),
            boxShadow: const [
              BoxShadow(
                color: AppColors.purpleFF,
                offset: Offset(-5,0),
              ),
              BoxShadow(
                color: AppColors.purpleFF,
                offset: Offset(5,0),
              )
            ]
        ),
        child: Center(
          child: Text(percentValue.toString(),
            style: TextStyle(
                fontSize: MySize.size10,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
