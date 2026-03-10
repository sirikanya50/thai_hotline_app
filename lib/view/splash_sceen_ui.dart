import 'package:flutter/material.dart';
import 'package:thai_hotline_aapp/view/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();
    // หน่วงเวลา 3 วินาทีแล้วเปลี่ยนหน้า
    Future.delayed(const Duration(seconds: 3), () {
      // ตรวจสอบว่า Widget ยังอยู่ในหน้าจอไหมก่อนจะ Navigator
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeUI()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/พื้นหลัง.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/handshake.png",
                width: 200,
                height: 200,
                fit: BoxFit.contain,

                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 100);
                },
              ),

              const SizedBox(height: 30),

              Stack(
                children: [
                  Text(
                    'THAI HOTLINE APP',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4
                        ..color = const Color.fromARGB(255, 235, 216, 216),
                    ),
                  ),
                  const Text(
                    'THAI HOTLINE APP',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 65, 58, 58),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              Stack(
                children: [
                  Text(
                    'สายด่วน',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = const Color.fromARGB(255, 163, 156, 156),
                    ),
                  ),
                  const Text(
                    'สายด่วน',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const CircularProgressIndicator(
                color: Color.fromARGB(255, 51, 61, 67),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
