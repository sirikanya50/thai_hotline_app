import 'package:flutter/material.dart';
 
class AboutUI extends StatefulWidget {
  const AboutUI({super.key});
 
  @override
  State<AboutUI> createState() => _AboutUIState();
}
 
class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สายด่วน THAILAND'),
        backgroundColor: Color.fromARGB(255, 169, 169, 169), // สีเทาอ่อนเหมือนในรูป
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text('ผู้จัดทำ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
             
              const SizedBox(height: 20),
              Image.asset('assets/images/logosau.png', width: 120),
              SizedBox(height: 20),
              const Text('มหาวิทยาลัยเอเชียอาคเนย์'),
             
              const SizedBox(height: 30),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/me.jpg'),
              ),
             
              const SizedBox(height: 30),
              const Text('รหัสนักศึกษา: 6619410050'),
              const Text('ชื่อ-สกุลนักศึกษา: ศิริกัญญา รักษาพล'),
              const Text('อีเมลนักศึกษา: s6619410050@sau.ac.th'),
              const Text('ชื่อสาขาวิชา: คอมพิวเตอร์'),
              const Text('ชื่อคณะ: วิศวกรรมศาสตร์'),
            ],
          ),
        ),
      ),
    );
  }
}
 