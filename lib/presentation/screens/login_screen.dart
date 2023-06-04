import 'package:flutter/material.dart';
import 'package:flutter_important/core/screens.dart' as screens;
import 'package:flutter_important/presentation/widgets/default_material_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../widgets/default_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHidden = true;
  IconData suffixIcon = Icons.visibility;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void showAndHidePassword() {
    setState(() {
      if (isHidden) {
        suffixIcon = Icons.visibility_off;
      } else {
        suffixIcon = Icons.visibility;
      }
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, screens.settingsScreen),
            icon: const Icon(Icons.settings)),
        title: DefaultText(
          text: AppLocalizations.of(context)!.login,
          textSize: 20.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    Fluttertoast.showToast(
                        msg: "Image tapped!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.sp);
                  });
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 8.w),
                  child: Image.asset(
                    'assets/image.gif',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: TextFormField(
                  controller: userNameController,
                  keyboardType: TextInputType.name,
                  scrollPhysics: const ScrollPhysics(),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.deepOrange,
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.username,
                    ),
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 1.sp),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 1.sp),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.sp),
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return AppLocalizations.of(context)!.usernameValidation;
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 10.w).copyWith(top: 2.h),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  scrollPhysics: const ScrollPhysics(),
                  obscureText: isHidden,
                  obscuringCharacter: '\$',
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.deepOrange,
                    ),
                    suffixIcon: IconButton(
                      onPressed: showAndHidePassword,
                      icon: Icon(
                        suffixIcon,
                        color: Colors.deepOrange,
                      ),
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.password,
                    ),
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 1.sp),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 1.sp),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.sp),
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return AppLocalizations.of(context)!.passwordValidation;
                    } else if (text.length < 6) {
                      return AppLocalizations.of(context)!.passwordSecondValidation;
                    }
                    return null;
                  },
                ),
              ),
              DefaultMaterialButton(
                height: 6.h,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      Fluttertoast.showToast(
                          msg: AppLocalizations.of(context)!.loginSucceeded,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.sp);
                    });
                    Navigator.pushNamedAndRemoveUntil(
                        context, screens.homeScreen, (route) => false,
                        arguments: {
                          'name': userNameController.text,
                          'password': passwordController.text
                        });
                  }
                },
                margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
                radius: 20.sp,
                splashColor: Colors.white,
                child: DefaultText(
                  text: AppLocalizations.of(context)!.login,
                  textColor: Colors.white,
                  weight: FontWeight.bold,
                  textSize: 15.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      height: 2.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: DefaultText(
                      text: AppLocalizations.of(context)!.or,
                      textSize: 18.sp,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      height: 2.h,
                    ),
                  ),
                ],
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 9.w).copyWith(top: 4.h),
                height: 6.h,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        Fluttertoast.showToast(
                            msg: AppLocalizations.of(context)!.loginWithGoogleSucceeded,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.sp);
                      });
                    }
                  },
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      side:
                          const BorderSide(width: 2, color: Colors.blueAccent)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 4.w),
                        child: SvgPicture.asset(
                          'assets/google.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Flexible(
                        child: DefaultText(
                          text: AppLocalizations.of(context)!.loginWithGoogle,
                          textColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: DefaultText(
                        text: AppLocalizations.of(context)!.noAccount,
                        textSize: 12.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: DefaultText(
                        text: AppLocalizations.of(context)!.signUpNow,
                        textSize: 12.sp,
                        textColor: Colors.blue,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
