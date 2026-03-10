import 'package:flutter/material.dart';
import 'package:thai_hotline_aapp/models/hotline_model.dart';
import 'package:url_launcher/url_launcher.dart';

 
class SubBHomeUi extends StatefulWidget {
  const SubBHomeUi({super.key});
 
  @override
  State<SubBHomeUi> createState() => _SubBHomeUiState();
}
 
class _SubBHomeUiState extends State<SubBHomeUi> {
  // ข้อมูลสายด่วนอุบัติเหตุ
  final List<HotlineModel> hotlineData = [
    HotlineModel(
      name: "เหตุด่วนเหตุร้าย",
      phone: "191",
      image: "assets/images/t1.jpg",
    ),
    HotlineModel(
      name: "แจ้งไฟไหม้สัตว์เข้าบ้าน",
      phone: "199",
      image: "assets/images/t2.png",
    ),
    HotlineModel(
      name: "สายด่วนรถหาย",
      phone: "1192",
      image: "assets/images/t3.jpg",
    ),
    HotlineModel(
      name: "อุบัติเหตุทางน้ำ",
      phone: "1196",
      image: "assets/images/t4.png",
    ),
    HotlineModel(
      name: "แจ้งคนหาย",
      phone: "1300",
      image: "assets/images/t5.png",
    ),
    HotlineModel(
      name: "ศูนย์ปลอดภัยคมนาคม",
      phone: "1356",
      image: "assets/images/t6.png",
    ),
    HotlineModel(
      name: "หน่วยแพทย์กู้ชีพ",
      phone: "1554",
      image: "assets/images/t7.jpg",
    ),
    HotlineModel(
      name: "ศูนย์เอราวัณ",
      phone: "1646",
      image: "assets/images/t8.png",
    ),
    HotlineModel(
      name: "เจ็บป่วยฉุกเฉิน",
      phone: "1669",
      image: "assets/images/t9.png",
    ),
  ];
 
  // ฟังก์ชันสั่งโทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 143, 172, 111),
      appBar: AppBar(
        title: const Text(
          "สายด่วนอุบัติเหตุ-เหตุฉุกเฉิน",
        ),
        backgroundColor: const Color.fromARGB(255, 45, 122, 10),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 247, 255, 247),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/Ambulance.jpg',
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported, size: 50),
                ),
              ),
            ),
          ),
 
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: hotlineData.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        hotlineData[index].image,
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.phone_in_talk),
                      ),
                    ),
                    title: Text(
                      hotlineData[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("${hotlineData[index].phone}"),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 31, 85, 33),
                        size: 30,
                      ),
                      onPressed: () => _makePhoneCall(hotlineData[index].phone),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
 
 