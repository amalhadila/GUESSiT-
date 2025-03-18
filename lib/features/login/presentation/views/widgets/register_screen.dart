import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/core/theme/styles.dart';
import 'package:guessit_task/features/home/presentation/views/home_view.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/EmaiTextfield.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/login_view_body.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/password_textfield.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/region.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
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
                'Create new account',
                 textAlign: TextAlign.center,
                style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
              ),
               
              const SizedBox(height: 20),
              
               Align(
                alignment: Alignment.topLeft,
                child: Text('Email'),),
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
                  onPressed: () async{
                                                      if (formkey.currentState!.validate()) {
          try {
                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: Email!,
                  password: password!,
                );
                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  Region()));
                    ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign up successful!'),
            backgroundColor: Colors.green, 
            duration: Duration(seconds: 2),
          ),
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                   ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('The password provided is too weak.'),
                          duration: Duration(seconds: 2), 
                        ),
                      );
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                   ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('The account already exists for that email.'),
                          duration: Duration(seconds: 2), 
                        ),
                      );
                }
              } catch (e) {
                print(e);
                ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text(e.toString()),
                          duration: Duration(seconds: 2), 
                        ),
                      );
              }}
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
                    'Sign up',
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
                                    builder: (context) =>  LoginViewBody()));
                    },
                    child: Text(
                      "Have Account? Login",
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
  