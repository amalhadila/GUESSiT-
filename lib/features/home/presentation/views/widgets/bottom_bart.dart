import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/features/home/presentation/views/home_view.dart';

class BottomBarViewDart extends StatefulWidget {
  const BottomBarViewDart({super.key});

  
  @override
  State<BottomBarViewDart> createState() => _BottomBarViewDartState();
}

class _BottomBarViewDartState extends State<BottomBarViewDart> {
    
   int currentindex =0;


        static  List<Widget> _pages =[];


      String  search_text='';

    @override
  void initState() {
    super.initState();
    _pages = [
     HomeView(),
   Text('data'),
   Text('data'),
   Text('data'),
    ];
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: _pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(  
        backgroundColor: Colors.white,    
         type: BottomNavigationBarType.fixed,
        elevation: 0,
      onTap: (value){        
        setState(() {
          currentindex=value;
        });
      },
      currentIndex: currentindex,
      selectedItemColor:  ColorApp.primaryColor,
      unselectedItemColor:Color(0xff8E8E8E),
      items: const [
       BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profie'),
    ],
     
    ),
    ) ;
  }
}