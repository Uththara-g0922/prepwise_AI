import 'package:flutter/material.dart';
import 'package:prepwise_ai/core/theme/app_colors.dart';
import 'package:prepwise_ai/core/theme/app_radius.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  late final Animation<double> _titleFadeAnimation;
  late final Animation<double> _subtitleFadeAnimation;

  late final Animation<double> _robotFadeAnimation;
  late final Animation<double> _robotScaleAnimation;

  late final Animation<double> _descriptionFadeAnimation;

  late final Animation<double> _buttonFadeAnimation;
late final Animation<Offset> _buttonSlideAnimation;

  @override
  void initState()
   {
    super.initState();

    _controller = AnimationController (vsync:this,
    duration: const Duration(milliseconds: 1200),
    );

    _titleFadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
    ).animate(
      CurvedAnimation(
    parent:_controller,
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
    parent:_controller,
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
    parent:_controller,
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
    parent:_controller,
    curve: const Interval(
    0.35,
    0.75,
    curve: Curves.easeOutBack,
    ),
    ),
    );

    _descriptionFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _controller,
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
      CurvedAnimation(parent: _controller,
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
        parent: _controller,
        curve: const Interval(
          0.75, 
          1.0,
     curve: Curves.easeOut,
     ),
     ),
     );




    _controller.forward();

  }

  @override
  void dispose(){
    _controller.dispose();
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

        ScaleTransition(
          scale: _robotScaleAnimation,
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
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  fit: BoxFit.cover,
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
              onPressed: () {},

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