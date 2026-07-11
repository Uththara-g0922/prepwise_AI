import 'package:flutter/material.dart';
import 'package:prepwise_ai/core/theme/app_colors.dart';
import 'package:prepwise_ai/core/theme/app_radius.dart';
import 'package:prepwise_ai/features/onboarding/presentation/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
with TickerProviderStateMixin {

  late final AnimationController _entranceController;
  late final AnimationController _idleController;

  late final Animation<double> _titleFadeAnimation;
  late final Animation<double> _subtitleFadeAnimation;

  late final Animation<double> _robotFadeAnimation;
  late final Animation<double> _robotScaleAnimation;

  late final Animation<double> _descriptionFadeAnimation;

  late final Animation<double> _buttonFadeAnimation;
late final Animation<Offset> _buttonSlideAnimation;

late final Animation<Offset> _robotFloatAnimation;
late final Animation<double> _robotIdleScaleAnimation;

  @override
  void initState()
   {
    super.initState();

    _entranceController = AnimationController (vsync:this,
    duration: const Duration(milliseconds: 2200),

    );

    _idleController = AnimationController (
      vsync:this,
    duration: const Duration(milliseconds: 2500),

    );

    _titleFadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
    ).animate(
      CurvedAnimation(
    parent:_entranceController,
    curve: const Interval(
    0.0,
    0.35,
    curve: Curves.easeIn,
    ),
    ),

    );

        _subtitleFadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
    ).animate(
      CurvedAnimation(
    parent:_entranceController,
    curve: const Interval(
    0.20,
    0.55,
    curve: Curves.easeIn,
    ),
    ),

    );

    _robotFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
    parent:_entranceController,
    curve: const Interval(
    0.35,
    0.75,
    curve: Curves.easeIn,
    ),
    ),
    );

    _robotScaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(
      CurvedAnimation(
    parent:_entranceController,
    curve: const Interval(
    0.35,
    0.75,
    curve: Curves.easeOutCubic,
    ),
    ),
    );

    _descriptionFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _entranceController,
     curve: const Interval(
      0.60,
      0.85,
     curve: Curves.easeIn,
     ),
     ),
     );

     _buttonFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: _entranceController,
     curve: const Interval(
      0.75, 
      1.0,
     curve: Curves.easeIn,
     ),
     ),
     );

     _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(
          0.75, 
          1.0,
     curve: Curves.easeOut,
     ),
     ),
     );

     _robotFloatAnimation = Tween<Offset>(
      begin:  const Offset(0, 0.02),
      end: const Offset(0, -0.02),
  ).animate(
    CurvedAnimation(
      parent: _idleController, 
      curve: Curves.easeInOut,
    ),
  );

  _robotIdleScaleAnimation = Tween<double>(
  begin: 1.00,
  end: 1.02,
).animate(
  CurvedAnimation(
    parent: _idleController,
    curve: Curves.easeInOut,
  ),
);


    _entranceController.addStatusListener((status) {
  if (status == AnimationStatus.completed) {
    _idleController.repeat(reverse: true);
  }
});

_entranceController.forward();


  }

  

  @override
  void dispose(){
    _entranceController.dispose();
    _idleController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 430,
            ),
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
          
          children: [
            const Spacer(),

            
            FadeTransition(opacity: _titleFadeAnimation,
            child:Text(
              "PrepWise AI",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color:AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            ),
            

            const SizedBox(height: 8),

          FadeTransition(opacity: _subtitleFadeAnimation,
          child:Text(
              "Your Personal AI Interview Coach",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            ),
            ),
            

            const SizedBox(height: 40),

        SlideTransition(
          position:_robotFloatAnimation,
          child:ScaleTransition(
          scale: _robotScaleAnimation,
          child: ScaleTransition(scale:_robotIdleScaleAnimation,
          
          child: FadeTransition(
            opacity: _robotFadeAnimation,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.large),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 18,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
            
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.large),
                child: Image.asset(
                  'assets/images/robot.jpeg',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        ),
        ),
        
        const SizedBox(height: 24),

        FadeTransition(
          opacity: _descriptionFadeAnimation,
          child: SizedBox(
             width: 320,
             child: Text(
          "Practice smarter with AI-powered mock interviews,\nreal-time feedback, and personalized insights.",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
             ),
        ),
        ),

        const Spacer(),

        SlideTransition(
        position: _buttonSlideAnimation,
        child: FadeTransition(
          opacity: _buttonFadeAnimation,
          child:SizedBox(
            width: 230,
            height: 56,
            child: FilledButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (_, animation, __) => const OnboardingScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },

            icon: const Icon(Icons.arrow_forward_rounded),

            label: const Text("Get Started"),
          ),
        ),
        ),
        ),

        

        const SizedBox(height: 20),

         Text(
            "Version 1.0",
            style: Theme.of(context).textTheme.bodySmall,
          ),

          const SizedBox(height: 24),


          ],
        ),
      ),
      )
      )
        
      ),
    );
  } 
}