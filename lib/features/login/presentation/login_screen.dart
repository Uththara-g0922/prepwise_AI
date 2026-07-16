import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prepwise_ai/core/theme/app_colors.dart';
import 'package:prepwise_ai/core/theme/app_spacing.dart';
import 'package:prepwise_ai/core/theme/app_radius.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  // Splash Screen එකෙන් මෙහාට එද්දි Scale Animation එකක් සහිතව open වෙන්න හදපු Route එක
  static Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginScreen(),
      transitionDuration: const Duration(milliseconds: 5000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve:
              Curves.easeOutBack, // Bounce effect එකක් සහිත සුමට animation එකක්
        );
        return ScaleTransition(
          scale: curvedAnimation,
          alignment: Alignment.center, // මැද සිට scale වීම ආරම්භ වේ
          child: child,
        );
      },
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _inputStyle(String hint, IconData icon, ThemeData theme) {
    return InputDecoration(
      hintText: hint,
      hintStyle: theme.textTheme.bodyMedium?.copyWith(
        color: AppColors.textSecondary.withOpacity(0.5),
      ),
      prefixIcon: Icon(
        icon,
        color: AppColors.textSecondary.withOpacity(0.7),
        size: 20,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        borderSide: BorderSide(
          color: AppColors.textSecondary.withOpacity(0.4),
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFEAF2FF), Color(0xFFFFFFFF), Color(0xFFEAF2FF)],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const SizedBox(height: AppSpacing.sm),

                        // Back Button
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.lg,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Robot Image Space
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Image.asset(
                              'assets/images/login_robot.png',
                              height: 150,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.smart_toy,
                                  size: 90,
                                  color: AppColors.primary,
                                );
                              },
                            ),
                          ),
                        ),

                        // Bottom Card Sheet
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.lg,
                            vertical: AppSpacing.xl,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                offset: Offset(0, -5),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: theme.textTheme.headlineMedium
                                        ?.copyWith(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    children: const [
                                      TextSpan(
                                        text: 'Welcome ',
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Back',
                                        style: TextStyle(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.sm),

                                Text(
                                  'Log into continue your interview preparation',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textSecondary,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.lg),

                                // Email Field
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                                  decoration: _inputStyle(
                                    'email@gmail.com',
                                    Icons.mail_outline,
                                    theme,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.md),

                                // Password Field
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                                  decoration: _inputStyle(
                                    'Create password',
                                    Icons.lock_outline,
                                    theme,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.md),

                                // Remember Me & Forgot Password
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Checkbox(
                                            value: _rememberMe,
                                            activeColor: AppColors.primary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                _rememberMe = value ?? false;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Remember me',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                color: AppColors.textPrimary,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                              ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Forgot Password?',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSpacing.lg),

                                // Log In Button
                                Container(
                                  width: double.infinity,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.large,
                                    ),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF2563EB),
                                        Color(0xFF38BDF8),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        // Login Action
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppRadius.large,
                                        ),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Log In',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.lg),

                                // Divider
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Divider(
                                        color: AppColors.surfaceVariant,
                                        thickness: 1.5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppSpacing.sm,
                                      ),
                                      child: Text(
                                        'or login with',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              color: AppColors.textSecondary
                                                  .withOpacity(0.6),
                                              fontSize: 13,
                                            ),
                                      ),
                                    ),
                                    const Expanded(
                                      child: Divider(
                                        color: AppColors.surfaceVariant,
                                        thickness: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSpacing.lg),

                                // Social Logins
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildSocialButton(
                                        icon: FontAwesomeIcons.google,
                                        label: 'Google',
                                        iconColor: const Color(0xffDE4032),
                                        onTap: () {},
                                      ),
                                    ),
                                    const SizedBox(width: AppSpacing.md),
                                    Expanded(
                                      child: _buildSocialButton(
                                        icon: FontAwesomeIcons.apple,
                                        label: 'Apple',
                                        iconColor: Colors.black,
                                        onTap: () {},
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSpacing.lg),

                                // Sign Up Link
                                Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: RichText(
                                      text: TextSpan(
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(fontSize: 14),
                                        children: const [
                                          TextSpan(
                                            text: "Don't have an account? ",
                                            style: TextStyle(
                                              color: AppColors.textSecondary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "Sign Up",
                                            style: TextStyle(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.medium),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.medium),
          border: Border.all(color: AppColors.surfaceVariant, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, color: iconColor, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
