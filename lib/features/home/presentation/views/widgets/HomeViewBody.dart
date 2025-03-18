import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';

class Homeviewbody extends StatelessWidget {
  const Homeviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/User-Avatar1.png'),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Good Morning☀️",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text("Mahmoud Meki",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search for Job or Company",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                  suffixIcon: Icon(Icons.tune, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  height: 160.h,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: ClipPath(
                    clipper: BlueBackgroundClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                    color: ColorApp.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                   height: 160.h,
                      width: 220.w,
                     
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "See how you Can\nFind a job Easily",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Read More",
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                      ),

                      Image.asset(
                        'assets/image3.png',
                        width: 100.w,
                        height: 120.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recommendation",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text("See All")),
              ],
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Row(
                children: [
                  Image.asset('assets/google.png', width: 40),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("UI/UX Designer",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const Text("Google LLC",
                          style: TextStyle(color: Colors.grey)),
                      const Text("California, United States",
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Text("\$10,000 - \$30,000 /month",
                              style: TextStyle(color: Colors.blue)),
                          const SizedBox(width: 5),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("Part time",
                            style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      icon: const Icon(Icons.bookmark_border), onPressed: () {}),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recent Jobs",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text("See All")),
              ],
            ),
            const SizedBox(height: 10),

            SizedBox(
                height: 70.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ColorApp.primaryColor),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 4)
                          ],
                        ),
                        child: const Text("Product Designer",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold,color: ColorApp.primaryColor)),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class BlueBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
