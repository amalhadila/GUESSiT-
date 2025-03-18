import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/core/theme/styles.dart';
import 'package:guessit_task/features/home/presentation/views/home_view.dart';
import 'package:guessit_task/features/home/presentation/views/widgets/bottom_bart.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/EmaiTextfield.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/otp.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/password_textfield.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/reset_pass.dart';

class LoginViewBody extends StatefulWidget {
  @override
  _LoginViewBodyState createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool passwordVisible = false;
  bool isvisible = false;
  String? password, Email;
   GlobalKey<FormState> formkey=GlobalKey();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
           key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Image.asset('assets/Logo(1).png', height: 87.h,width: 175.w,),
              const SizedBox(height: 10),
               Text(
                'Login to your account',
                style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
                 textAlign: TextAlign.center,
              ),
               
              const SizedBox(height: 20),
              
               Align(
                alignment: Alignment.topLeft,
                child: const Text('Email')),
              EmaiTextfield(
                onChanged: (value) {
                  Email = value;
                },
              ),
          
              const SizedBox(height: 15),
          
              Align(
                alignment: Alignment.topLeft,
                child: Text('Password'),),
              PasswordTextfield(
                onChanged: (value) {
                  password = value;
                },
                isobscure: !isvisible,
                togglevisibility: () {
                  setState(() {
                    isvisible = !isvisible;
                  });
                },
                isvisible: isvisible,
              ),
          
              
          
              const SizedBox(height: 15),
          
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()async {
                       if (formkey.currentState!.validate()) {
        try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Email!,
        password: password!,
      );
      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomBarViewDart()));
          ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful!'),
          backgroundColor: Colors.green, 
          duration: Duration(seconds: 2),
        ),
      );
        } on FirebaseAuthException catch (e) {
      print('Login failed: ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password.'),
          duration: Duration(seconds: 2),
        ),
      );
        }catch (e) {
              print(e);
              ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                        content: Text(e.toString()),
                        duration: Duration(seconds: 2), 
                      ),
                    );
            }
            
            
      }
                    
                          
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(271.w, 50.h),
                    backgroundColor: ColorApp.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    
                  ),
                  child: Text(
                    'Log in',
                    style: Styles.textStyle16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
          
             
          
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                       Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ResetPass()));
                          
                    },
                    child: Text(
                      "Forget your password",
                      style: Styles.textStyle16.copyWith(
                        color: ColorApp.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
                          const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          _buildSocialButton('assets/face.png'),
          SizedBox(width: 20),
          _buildSocialButton('assets/google.png'),
          SizedBox(width: 20),
          _buildSocialButton('assets/linkedin.png'),
                ],
              ),
              const SizedBox(height: 25),
             
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildSocialButton(String iconPath) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: Image.asset(iconPath, width: 30, height: 30),
    );
  }
    }
  