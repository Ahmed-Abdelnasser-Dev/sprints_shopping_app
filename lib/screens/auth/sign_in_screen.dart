import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../l10n/locale_keys.dart';
import '../../models/user.dart';
import '../../screens/home_screen.dart';
import '../../utils/animations.dart';
import '../../theme/app_theme.dart';
import '../auth/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      final storedUser = await User.getUser();

      if (storedUser != null &&
          _emailController.text == storedUser.email &&
          _passwordController.text == storedUser.password) {
        setState(() => _isLoading = false);

        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppTheme.surface,
            title: Text(
              LocaleKeys.success.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            content: Text(
              LocaleKeys.login_success.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    FadeRouteBuilder(page: HomeScreen(user: storedUser)),
                  );
                },
                child: Text(
                  LocaleKeys.close.tr(),
                  style: TextStyle(color: AppTheme.accent),
                ),
              ),
            ],
          ),
        );
      } else {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              LocaleKeys.invalid_credentials.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            backgroundColor: AppTheme.error,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.primary.withOpacity(0.8),
                      AppTheme.background,
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.lock_outline,
                    size: 64,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ),
            ),
            pinned: true,
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      LocaleKeys.sign_in.tr(),
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.email.tr(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.email_required.tr();
                        }
                        if (!value.contains('@')) {
                          return LocaleKeys.email_invalid.tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.password.tr(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.password_required.tr();
                        }
                        if (value.length < 6) {
                          return LocaleKeys.password_length.tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) =>
                              setState(() => _rememberMe = value!),
                          fillColor: WidgetStateProperty.resolveWith<Color>(
                            (states) => states.contains(WidgetState.selected)
                                ? AppTheme.accent
                                : AppTheme.secondary,
                          ),
                        ),
                        Text(
                          LocaleKeys.remember_me.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            LocaleKeys.forgot_password.tr(),
                            style: TextStyle(color: AppTheme.accent),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _submitForm,
                      child: _isLoading
                          ? SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: AppTheme.textPrimary,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(LocaleKeys.sign_in.tr()),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.no_account.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          ),
                          child: Text(
                            LocaleKeys.sign_up.tr(),
                            style: TextStyle(color: AppTheme.accent),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
