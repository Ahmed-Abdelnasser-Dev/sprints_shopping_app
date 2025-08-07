import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../l10n/locale_keys.dart';
import '../../models/user.dart';
import '../../screens/home_screen.dart';
import '../../utils/animations.dart';
import '../../theme/app_theme.dart';
import '../auth/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      final newUser = User(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      await User.saveUser(newUser);

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
            LocaleKeys.account_created.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  FadeRouteBuilder(page: HomeScreen(user: newUser)),
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
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                    Icons.person_add,
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
                      LocaleKeys.sign_up.tr(),
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.full_name.tr(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.name_required.tr();
                        }
                        if (value[0] != value[0].toUpperCase()) {
                          return LocaleKeys.name_capital.tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
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
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.confirm_password.tr(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return LocaleKeys.password_match.tr();
                        }
                        return null;
                      },
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
                          : Text(LocaleKeys.sign_up.tr()),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.have_account.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()),
                          ),
                          child: Text(
                            LocaleKeys.sign_in.tr(),
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
