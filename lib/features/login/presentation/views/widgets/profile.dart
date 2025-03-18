import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/core/theme/styles.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/EmaiTextfield.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/nametextfield.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/phone_textfield.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/pin.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool passwordVisible = false;
  bool isvisible = false;
  String? phone, Email,name,gender;
  String birth='Birth';
   List<String> genders = ["Male", "Female"];

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        birth = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }
  
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset('assets/Logo(1).png', height: 87.h,width: 175.w,),
              const SizedBox(height: 10),
               Stack(children:[ Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   CircleAvatar(radius: 60,backgroundImage: AssetImage('assets/User-Avatar1.png'),
                   backgroundColor: Colors.white,),
                 ],
               ),
              Positioned(
                 bottom: 0, 
                left: 240,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF69A28)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child:  Icon(Icons.edit,size: 20,color: Colors.black,),
                  ),
                ),))
              )
              
              ]),
               Text(
                'Fill your profile',
                style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
              ),
               
              const SizedBox(height: 20),
               Align(
                alignment: Alignment.topLeft,
                child: const Text('Name')),
              NameTextfield(
                onChanged: (value) {
                  name = value;
                },
              ),
        
              const SizedBox(height: 15),
               Align(
                alignment: Alignment.topLeft,
                child: const Text('Birth')),
              TextField(
                readOnly: true,
              onChanged: (value) {
                  birth = value;
                },
              decoration: InputDecoration(
                hintText: birth,
                
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today, color: Colors.blue),
                  onPressed: () { _selectDate(context);
                  (value) {
                  birth = value;
                };},
                ),
            
                border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorApp.primaryColor,width: 2)
          ),
           enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorApp.primaryColor,width: 2)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorApp.primaryColor,width: 2)
          ),
          
              ),
            ),
        
              const SizedBox(height: 15),
               Align(
                alignment: Alignment.topLeft,
                child: const Text('Gender')),
              DropdownButtonFormField<String>(
              value: gender,
              hint: Text("Gender"),
              items: genders.map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
              decoration: InputDecoration(
                border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorApp.primaryColor,width: 2)
          ),
           enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorApp.primaryColor,width: 2)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorApp.primaryColor,width: 2)
          ),
              ),
            ),
            
        
              const SizedBox(height: 15),
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
                child: Text('phone'),),
              PhoneTextfield(
                onChanged: (value) {
                  phone = value;
                },
                
              ),
        
              
        
              const SizedBox(height: 15),
        
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Pin()));
                          
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
                    'Continue',
                    style: Styles.textStyle16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
        
             
        
             
            
              const SizedBox(height: 25),
             
            ],
          ),
        ),
      ),
    );
  }
  
    }
  