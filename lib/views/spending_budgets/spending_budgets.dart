import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../Provider/category_provider.dart';
import '../../notification_screen/notification_screen.dart';
import '../../theme/theme.dart';
import '../../utils/my_size.dart';
import '../base/custom_dottContainer.dart';
import '../base/linear_colorBar.dart';
import '../base/round_progressBar.dart';
import '../base/settingIcon_screen.dart';
import '../base/text_widgets.dart';

class SpendingBudgets extends StatefulWidget {
  const SpendingBudgets({super.key});

  @override
  State<SpendingBudgets> createState() => _SpendingBudgetsState();
}

class _SpendingBudgetsState extends State<SpendingBudgets> {
  List<String> titleText = ['Auto & Transport', 'Entertainment', 'Security'];
  List<String> subtitleText = [
    '\$375 left to spend',
    '\$375 left to spend',
    '\$375 left to spend'
  ];

  List<String> trailTitle = ['\$25.99', '\$50.99', '\$5.99'];
  List<String> trailSubtitle = ['of \$400', 'of \$600', 'of \$600'];

  List<Color> gradientColors = [
    AppColors.accent100,
    const Color(0XFF758AFF),
    AppColors.purpleLine
  ];

  List<int> lineMaxSteps = [30, 30, 30];
  List<int> lineCurrentSteps = [10, 18, 24];

  List<Widget> myIcon = [
    Image.asset(
      AppImages.carIcon,
      width: MySize.size32,
      height: MySize.size32,
    ),
    Image.asset(
      AppImages.starsIcon,
      width: MySize.size32,
      height: MySize.size32,
    ),
    Image.asset(
      AppImages.fingerIcon,
      width: MySize.size32,
      height: MySize.size32,
    ),
  ];
  TextEditingController? addCategoryController = TextEditingController();
  TextEditingController? priceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MySize.size72),
          child: Padding(
            padding: EdgeInsets.only(left: MySize.size8, top: MySize.size24),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Spending & Budgets',
                style: TextStyle(
                    color: const Color(0xFF424252),
                    fontSize: MySize.size16,
                    fontWeight: FontWeight.w400),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: MySize.size25),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationsScreen()));
                      },
                      child: Image.asset(
                        AppImages.notificationIcon,
                        height: MySize.size25,
                        width: MySize.size25,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? const Color(0XFFA2A2B5)
                            : const Color(0XFF424252),
                      )),
                )
              ],
            ),
          ),
        ),
        backgroundColor:
            Provider.of<ThemeChanger>(context).themeData == darkMode
                ? const Color(0XFF1C1C23)
                : const Color(0XFFF7F7FF),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MySize.scaleFactorHeight * 43,
              ),
              SizedBox(
                height: MySize.scaleFactorHeight * 160,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      startAngle: 180,
                      endAngle: 360,
                      radiusFactor: 01.2,
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle: const AxisLineStyle(
                        thickness: 0.07,
                        cornerStyle: CornerStyle.bothCurve,
                        color: Colors.black,
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      pointers: const <GaugePointer>[
                        RangePointer(
                          value: 75,
                          cornerStyle: CornerStyle.bothCurve,
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: Color(0xFFDB23FD),
                        ),
                        RangePointer(
                          value: 42,
                          cornerStyle: CornerStyle.endCurve,
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: Colors.black,
                        ),
                        RangePointer(
                          value: 40,
                          cornerStyle: CornerStyle.bothCurve,
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: Color(0xFF7689FF),
                        ),
                        RangePointer(
                          value: 22,
                          cornerStyle: CornerStyle.bothCurve,
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: Colors.black,
                        ),
                        RangePointer(
                          value: 20,
                          cornerStyle: CornerStyle.endCurve,
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: Color(0xFF02E3E5),
                        ),
                        RangePointer(
                          value: 00,
                          cornerStyle: CornerStyle.bothCurve,
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: Colors.black,
                        ),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          angle: 90,
                          positionFactor: 00,
                          widget: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                '\$82,97',
                                style: TextStyle(
                                    fontSize: MySize.size24,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF424252)),
                              ),
                              SizedBox(height: MySize.size4),
                              Text(
                                'of \$2,000 budget',
                                style: TextStyle(
                                  fontSize: MySize.size12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFA2A2B5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MySize.size60,
                width: MySize.scaleFactorWidth * 326,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.transparent,
                  border: Border.all(
                      color: Provider.of<ThemeChanger>(context).themeData ==
                              darkMode
                          ? const Color(0XFF4E4E61)
                          : const Color(0XFF4E4E61).withOpacity(.20),
                      width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidgetInterMedium(
                        title: 'Your budgets are on track',
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF424252),
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      width: MySize.size8,
                    ),
                    Image.asset(AppImages.handIcon,
                        width: MySize.size14, height: MySize.size16)
                  ],
                ),
              ),
              SizedBox(
                height: MySize.size16,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: titleText.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MySize.size8),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: MySize.size24),
                          child: Container(
                            height: MySize.scaleFactorHeight * 96,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(MySize.size16),
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFF4E4E61).withOpacity(0.2)
                                    : const Color(0XFFF1F1FF),
                                border: Border.all(
                                  color: Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                          darkMode
                                      ? const Color(0XFFCFCFFC)
                                          .withOpacity(0.15)
                                      : const Color(0XFFCFCFFC)
                                          .withOpacity(0.15),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  title: Text(
                                    titleText[index],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: MySize.size16,
                                      fontWeight: FontWeight.w600,
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? const Color(0XFFFFFFFF)
                                          : const Color(0XFF424252),
                                    ),
                                  ),
                                  subtitle: Text(
                                    subtitleText[index],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: MySize.size12,
                                      fontWeight: FontWeight.w500,
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? const Color(0xFFA2A2B5)
                                          : const Color(0xFFA2A2B5),
                                    ),
                                  ),
                                  leading: myIcon[index],
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        trailTitle[index],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: MySize.size14,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Provider.of<ThemeChanger>(context)
                                                          .themeData ==
                                                      darkMode
                                                  ? const Color(0XFFFFFFFF)
                                                  : const Color(0XFF424252),
                                        ),
                                      ),
                                      Text(
                                        trailSubtitle[index],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: MySize.size12,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Provider.of<ThemeChanger>(context)
                                                          .themeData ==
                                                      darkMode
                                                  ? const Color(0XFFA2A2B5)
                                                  : const Color(0XFFA2A2B5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MySize.size5,
                                      left: MySize.size20,
                                      right: MySize.size25),
                                  child: LinearColorBar(
                                      index: index,
                                      lineMaxSteps: lineMaxSteps,
                                      lineCurrentSteps: lineCurrentSteps,
                                      gradientColors: gradientColors),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MySize.size24, vertical: MySize.size8),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Consumer<CategoryProvider>(
                          builder: (context, categoryProvider, child) {
                            return AlertDialog(
                              backgroundColor:
                                  Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                          darkMode
                                      ? Colors.white
                                      : Colors.black,
                              title: Center(
                                child: Text(
                                  'Spending & Budgets',
                                  style: TextStyle(
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0xFF000000)
                                        : const Color(0xFFFFFFFF),
                                    fontSize: MySize.size16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              content: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Please enter new category and its price.',
                                      style: TextStyle(
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0xFF000000)
                                                : Colors.grey,
                                        fontSize: MySize.size14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: MySize.size20),
                                    TextFormField(
                                      cursorColor:
                                          Provider.of<ThemeChanger>(context)
                                                      .themeData ==
                                                  darkMode
                                              ? Colors.black
                                              : Colors.white,
                                      style: TextStyle(
                                        fontSize: MySize.size14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Inter',
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? Colors.black
                                                : Colors.white,
                                      ),
                                      controller: addCategoryController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Please enter category name';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                MySize.size20),
                                            borderSide: BorderSide(
                                                color:
                                                    Provider.of<ThemeChanger>(
                                                                    context)
                                                                .themeData ==
                                                            darkMode
                                                        ? Colors.white
                                                        : AppColors.grey20)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              MySize.size20),
                                          borderSide: BorderSide(
                                            color: Provider.of<ThemeChanger>(
                                                            context)
                                                        .themeData ==
                                                    darkMode
                                                ? Colors.black
                                                : Colors
                                                    .white, // Color for unselected border
                                          ),
                                        ),
                                        labelText: 'Category',
                                        hintText: 'Enter Category',
                                        hintStyle: TextStyle(
                                            fontSize: MySize.size12,
                                            fontWeight: FontWeight.w500,
                                            color: Provider.of<ThemeChanger>(
                                                            context)
                                                        .themeData ==
                                                    darkMode
                                                ? Colors.grey
                                                : Colors.grey,
                                            fontFamily: 'Inter-Medium'),
                                        labelStyle: TextStyle(
                                          color:
                                              Provider.of<ThemeChanger>(context)
                                                          .themeData ==
                                                      darkMode
                                                  ? Colors.black
                                                  : Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      cursorColor:
                                          Provider.of<ThemeChanger>(context)
                                                      .themeData ==
                                                  darkMode
                                              ? Colors.black
                                              : Colors.white,
                                      style: TextStyle(
                                        fontSize: MySize.size14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Inter',
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? Colors.black
                                                : Colors.white,
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Please enter price';
                                        }
                                        return null;
                                      },
                                      controller: priceController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                MySize.size20),
                                            borderSide: BorderSide(
                                                color:
                                                    Provider.of<ThemeChanger>(
                                                                    context)
                                                                .themeData ==
                                                            darkMode
                                                        ? Colors.white
                                                        : AppColors.grey20)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              MySize.size20),
                                          borderSide: BorderSide(
                                            color: Provider.of<ThemeChanger>(
                                                            context)
                                                        .themeData ==
                                                    darkMode
                                                ? Colors.black
                                                : Colors
                                                    .white, // Color for unselected border
                                          ),
                                        ),
                                        labelText: 'Price',
                                        hintText: 'Enter Price',
                                        hintStyle: TextStyle(
                                            fontSize: MySize.size12,
                                            fontWeight: FontWeight.w500,
                                            color: Provider.of<ThemeChanger>(
                                                            context)
                                                        .themeData ==
                                                    darkMode
                                                ? Colors.grey
                                                : Colors.grey,
                                            fontFamily: 'Inter-Medium'),
                                        labelStyle: TextStyle(
                                          color:
                                              Provider.of<ThemeChanger>(context)
                                                          .themeData ==
                                                      darkMode
                                                  ? Colors.black
                                                  : Colors.white,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? Colors.lightBlue
                                          : Colors.lightBlue,
                                      fontSize: MySize.size16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      categoryProvider.addCategories(
                                        categoryName:
                                            addCategoryController!.text.trim(),

                                        // price: priceController.text.trim(),
                                      );
                                      addCategoryController?.clear();
                                      priceController?.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Center(
                                            child: Text(
                                              'New category is added',
                                              style: TextStyle(
                                                  fontSize: MySize.size14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                                TextButton(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? Colors.redAccent
                                          : Colors.redAccent,
                                      fontSize: MySize.size15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    addCategoryController?.clear();
                                    priceController?.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.redAccent,
                                        content: Center(
                                          child: Text(
                                            'Cancelling to add new',
                                            style: TextStyle(
                                              color: Provider.of<ThemeChanger>(
                                                              context,
                                                              listen: false)
                                                          .themeData ==
                                                      darkMode
                                                  ? Colors.white
                                                  : Colors.white,
                                              fontSize: MySize.size14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: DottedBorder(
                    dashPattern: const [6, 6, 6, 6],
                    color:
                        Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? const Color(0XFF4E4E61)
                            : const Color(0XFF4E4E61).withOpacity(.5),
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(MySize.size12),
                    child: SizedBox(
                      height: MySize.scaleFactorHeight * 84,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add new category',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MySize.size14,
                              fontWeight: FontWeight.w600,
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? const Color(0XFFA2A2B5)
                                  : const Color(0XFFA2A2B5),
                            ),
                          ),
                          SizedBox(width: MySize.size10),
                          Container(
                            height: MySize.size16,
                            width: MySize.size16,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.circular(MySize.size90),
                              border: Border.all(
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0xFF4E4E61).withOpacity(0.4)
                                    : const Color(0xFF4E4E61).withOpacity(0.4),
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFFA2A2B5),
                                size: MySize.size14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
