// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "app_title": "المتجر الجمالي",
  "welcome_title": "مرحباً بكم في المتجر الجمالي",
  "welcome_subtitle": "اكتشف منتجات رائعة بأسعار ممتازة",
  "sign_up": "تسجيل حساب",
  "sign_in": "تسجيل دخول",
  "success": "نجاح",
  "account_created": "تم إنشاء الحساب بنجاح",
  "login_success": "تم تسجيل الدخول بنجاح",
  "close": "إغلاق",
  "full_name": "الاسم الكامل",
  "email": "البريد الإلكتروني",
  "password": "كلمة المرور",
  "confirm_password": "تأكيد كلمة المرور",
  "name_required": "الاسم مطلوب",
  "name_capital": "يجب أن يبدأ الاسم بحرف كبير",
  "email_required": "البريد الإلكتروني مطلوب",
  "email_invalid": "يجب أن يحتوي البريد على @",
  "password_required": "كلمة المرور مطلوبة",
  "password_length": "يجب أن تحتوي كلمة المرور على 6 أحرف على الأقل",
  "password_match": "يجب أن تتطابق كلمات المرور",
  "remember_me": "تذكرني",
  "forgot_password": "نسيت كلمة المرور؟",
  "no_account": "ليس لديك حساب؟",
  "our_products": "منتجاتنا",
  "all_products": "جميع المنتجات",
  "hot_offers": "العروض الساخنة",
  "added_to_cart": "تمت الإضافة إلى السلة",
  "undo": "تراجع",
  "invalid_credentials": "بريد إلكتروني أو كلمة مرور غير صحيحة"
};
static const Map<String,dynamic> _en = {
  "app_title": "Aesthetic Shop",
  "welcome_title": "Welcome to Aesthetic Shop",
  "welcome_subtitle": "Discover amazing products at great prices",
  "sign_up": "Sign Up",
  "sign_in": "Sign In",
  "success": "Success",
  "account_created": "Account created successfully",
  "login_success": "Account sign-in successfully",
  "close": "Close",
  "full_name": "Full Name",
  "email": "Email",
  "password": "Password",
  "confirm_password": "Confirm Password",
  "name_required": "Name is required",
  "name_capital": "First letter must be uppercase",
  "email_required": "Email is required",
  "email_invalid": "Email must include @",
  "password_required": "Password is required",
  "password_length": "Password must be at least 6 characters",
  "password_match": "Passwords must match",
  "remember_me": "Remember me",
  "forgot_password": "Forgot password?",
  "no_account": "Don't have an account?",
  "our_products": "Our Products",
  "all_products": "All Products",
  "hot_offers": "Hot Offers",
  "added_to_cart": "added to the cart",
  "undo": "UNDO",
  "invalid_credentials": "Invalid email or password"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
