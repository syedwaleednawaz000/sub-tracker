import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sub_tracker/Provider/register_provider.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/utils/validation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../theme/theme.dart';
import '../../../utils/app_Images.dart';
import '../../base/field_container.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  bool val = false;
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        backgroundColor: const Color(0XFF1C1C23),
        resizeToAvoidBottomInset: false,

        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bg3Image), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60,right: 280),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                  ),

                  SizedBox(height:MySize.size140,),
                   Text( AppLocalizations.of(context)!.create_account,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 24,
                        color: Colors.white
                    ),
                  ),

                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: MySize.size35),
                   child: Column(
                     children: [
                       CustomTextFormField(
                         controller: nameController,
                         text: "Name",
                         hintText: "Enter your name",
                         validator: Validation.validateName,
                         suffixIcons: IconButton(onPressed: (){},
                             icon:  Icon(Icons.email, color: const Color(0XFF666680).withOpacity(.3),)),
                       ),
                       SizedBox(height: MySize.size10,),
                       CustomTextFormField(
                         controller: emailController,
                         text: AppLocalizations.of(context)!.email_address,
                         hintText: AppLocalizations.of(context)!.email,
                         validator: Validation.validateEmail,
                         suffixIcons: IconButton(onPressed: (){},
                             icon:  Icon(Icons.email, color: const Color(0XFF666680).withOpacity(.3),)),
                       ),
                       SizedBox(height: MySize.size10,),
                       CustomTextFormField(
                         controller: passwordController,
                         text: AppLocalizations.of(context)!.password,
                         hintText: AppLocalizations.of(context)!.password,
                         validator:  Validation.validatePassword,
                         obscureText: isSelected1 ,
                         suffixIcons: IconButton(
                             onPressed: (){
                               isSelected1 = !isSelected1;
                             setState(() {
                                   });
                                 }, icon: isSelected1
                                     ? Icon(Icons.lock_open, color: const Color(0XFF666680).withOpacity(.3))
                                     : Icon(Icons.lock, color: const Color(0XFF666680).withOpacity(.3),)),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                   Consumer<RegisterProvider>(builder: (context, registerProvider, child) {
                     return                        CustomTextFormField(
                       onChanged: (newValue){
                         registerProvider.updatePassword(newValue);
                       },
                       controller: confirmPasswordController,
                       text: AppLocalizations.of(context)!.confirm_password,
                       hintText: AppLocalizations.of(context)!.confirm_password,
                       obscureText: isSelected2,
                       validator:  Validation.validatePassword,
                       suffixIcons: IconButton(onPressed: (){
                         setState(() {
                           isSelected2 = !isSelected2;
                         });
                       }, icon: isSelected2
                           ? Icon(Icons.lock_open, color: const Color(0XFF666680).withOpacity(.3))
                           : Icon(Icons.lock, color: const Color(0XFF666680).withOpacity(.3),)),
                     );
                   },),
                        SizedBox(height: MySize.size20,),

                       Consumer<RegisterProvider>(builder: (context, registerProvider, child) {
                         return StepProgressIndicator(
                           totalSteps: 4,
                           currentStep: registerProvider.strengthLevel,
                           size: 8,
                           padding: 0,
                           selectedColor: registerProvider.strengthLevel == 0
                               ? Colors.grey
                               : registerProvider.colors[registerProvider.strengthLevel - 1],
                           unselectedColor: Color(0XFF353542),
                           roundedEdges: Radius.circular(10),
                         );
                       },),
                       SizedBox(height: MySize.size17,),
                       Align(
                         alignment: Alignment.centerLeft,
                         child: Text(AppLocalizations.of(context)!.use_or_more_characters_with_a_mix_of_letters_numbers_symbols_to_be_secure,
                           textAlign: TextAlign.start,
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.w500,
                             // color: Color(0XFF666680),
                               color: AppColors.grey30.withOpacity(.3)
                           ),),
                       ),
                       SizedBox(height: MySize.size12,),
                       Row(
                         children: [
                           Transform.scale(
                             scale: 1.2,
                             child: Checkbox(
                               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                               visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
                               checkColor: const Color(0XFF666680),
                               side: BorderSide(
                                 style: BorderStyle.solid,
                                 width: 3,
                                 color: const Color(0XFF353542).withOpacity(.5),
                               ),
                               value: val,
                               onChanged: (value) => setState(() {
                                 val = !val;
                               }),
                             ),
                           ),
                           SizedBox(width: MySize.size6),
                           Expanded( // Ensure text wraps within available space
                             child: RichText(
                               text: TextSpan(
                                 children: [
                                   TextSpan(
                                     text: "${AppLocalizations.of(context)!.by_proceeding_you_agree_to_our} ",
                                     style: TextStyle(
                                       fontSize: 14,
                                       color: AppColors.grey30.withOpacity(.3),
                                     ),
                                   ),
                                    TextSpan(
                                     text: AppLocalizations.of(context)!.privacy_policy,
                                     style: TextStyle(
                                       color: Color(0XFF758AFF),
                                       fontSize: 14,
                                       decoration: TextDecoration.underline,
                                       decorationColor: AppColors.lightBlue,
                                     ),
                                   ),
                                   TextSpan(
                                     text: ' ${AppLocalizations.of(context)!.and} ',
                                     style: TextStyle(
                                       color: AppColors.grey30.withOpacity(.3),
                                       fontSize: 14,
                                     ),
                                   ),
                                    TextSpan(
                                     text: AppLocalizations.of(context)!.terms_of_use,
                                     style:  TextStyle(
                                       color: Color(0XFF758AFF),
                                       fontSize: 14,
                                       decoration: TextDecoration.underline,
                                       decorationColor: AppColors.lightBlue,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
                  SizedBox(height: MySize.size18,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: MySize.size35),
                child: Consumer<RegisterProvider>(builder: (context, registerProvider, child) {
                  return  GestureDetector(
                    onTap: (){
                      if (_formKey.currentState!.validate()) {
                        if (passwordController.text.trim() == confirmPasswordController.text.trim()) {
                          if (val == true) {
                            registerProvider.register(
                              name: nameController.text.trim(),
                              context: context,
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          } else {
                            FlutterToast.toastMessage(
                              message: "Please accept privacy and policy",
                              isError: true,
                            );
                          }
                        } else {
                          FlutterToast.toastMessage(
                            message: "Password doesn't match with confirm password",
                            isError: true,
                          );
                        }
                      }
                    },
                    child: Container(
                        height: MySize.scaleFactorHeight * 48,
                        width: MySize.scaleFactorWidth * 333,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MySize.size40),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 8),
                                blurRadius: 25,
                                color: const Color(0XFF4F63BE).withOpacity(.5)
                            )
                          ],
                          color: const Color(0XFF758AFF),
                        ),
                        child:  Center(
                          child: registerProvider.isRegister == true ?  const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(color: AppColors.purpleFF,)) :  Text(AppLocalizations.of(context)!.get_started,
                            style: TextStyle(color:Colors.white, fontSize: 16),
                          ),
                        )),
                  );
                },),
              ),
                  SizedBox(height: MySize.size40,),
                   Text(
                     AppLocalizations.of(context)!.do_you_have_already_an_account,
                     textAlign: TextAlign.center,
                     style: const TextStyle(
                       fontSize: 14,
                       fontWeight: FontWeight.w400,
                       color: Colors.white,
                     ),),
                  SizedBox(height: MySize.size20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:  (context) => const LoginScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MySize.size35
                      ),
                      child: FieldContainer(
                        // containerColor: AppColors.grey30.withOpacity(.3),
                        containerColor:  Provider.of<ThemeChanger>(context)
                            .themeData == darkMode
                            ?  AppColors.grey30.withOpacity(.15)
                            :  AppColors.grey30.withOpacity(.15),

                        mytitle: AppLocalizations.of(context)!.sign_in,
                        textColor: AppColors.white100.withOpacity(.8),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}

  class CustomTextFormField extends StatelessWidget {
     CustomTextFormField({
      super.key,
      required this.hintText,
      required this.text,
      this.suffixIcons,
      this.prefixIcons,
      this.onChanged,
      required this.validator,
      this.obscureText,
      required this.controller,
    });

    final String hintText;
    final TextEditingController controller;
    final String text;
    final IconButton? suffixIcons;
    final Icon? prefixIcons;
    void Function(String)? onChanged;
    final FormFieldValidator<String> validator;
    final bool? obscureText ;

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0XFF666680),
            ),),
         // color: Color(0XFF666680),
           SizedBox(
            height: MySize.size4,
          ),
          TextFormField(
            onChanged: onChanged,
            controller: controller,
            obscureText: obscureText ?? false,
            validator: validator,
            style: const TextStyle(
                 color:  Color(0XFF666680)
            ),
            decoration: InputDecoration(
              errorMaxLines: 3,
               isDense: true,
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                hintText: hintText,
                hintStyle:  TextStyle(
                  fontFamily: 'Poppins_Regular',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFF666680).withOpacity(.3),
                ),
                // hintStyle: TextStyle(color: Color(0XFF666680)),
                // suffixIcon: Icon(Icons.email, color: const Color(0XFF666680).withOpacity(.3),),
                suffixIcon: suffixIcons,
                prefixIcon: prefixIcons,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2))),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
              ),
            ),
          ),
        ],
      );
    }
  }
