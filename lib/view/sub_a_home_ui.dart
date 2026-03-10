import 'package:flutter/material.dart';
import 'package:thai_hotline_aapp/models/hotline_model.dart';
import 'package:url_launcher/url_launcher.dart';

 
class SubAHomeUi extends StatefulWidget {
  const SubAHomeUi({super.key});
 
  @override
  State<SubAHomeUi> createState() => _SubAHomeUiState();
}
 
class _SubAHomeUiState extends State<SubAHomeUi> {
  // ... (ข้อมูล hotlineData เหมือนเดิม) ...
  final List<HotlineModel> hotlineData = [
     HotlineModel(
      name: "ข้อมูลจราจร",
      phone: "1197",
      image: "assets/images/logo1.jpg",
    ),
    HotlineModel(
      name: "กรมทางหลวงชนบท",
      phone: "1146",
      image: "assets/images/logo2.png",
    ),
    HotlineModel(
      name: "ตำรวจท่องเที่ยว",
      phone: "1155",
      image: "assets/images/logo3.png",     
    ),
    HotlineModel(
      name: "ตำรวจทางหลวง",
      phone: "1193",
      image: "assets/images/logo4.png",
    ),   
    
    HotlineModel(
      name: "การทางพิเศษแห่งประเทศไทย",
      phone: "1543",
      image: "assets/images/logo5.png",
    ),
    HotlineModel(
      name: "บริษัท ขนส่ง จำกัด (บขส)",
      phone: "1490",
      image: "assets/images/logo8.png",
    ),
    HotlineModel(
      name: "กรมทางหลวง",
      phone: "1586",
      image: "assets/images/logo6.png",
    ),
    HotlineModel(
      name: "การรถไฟแห่งประเทศไทย",
      phone: "1690",
      image: "assets/images/logo7.png",
    ),
  ];
 
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 143, 172, 111),
      appBar: AppBar(
        title: const Text('สายด่วนเดินทางการเดินทาง'),
        backgroundColor: const Color.fromARGB(255, 45, 122, 10),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 247, 255, 247),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/ภาพรถ.jpg',
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 150,
                  color: const Color.fromARGB(255, 124, 182, 146),
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
 
 