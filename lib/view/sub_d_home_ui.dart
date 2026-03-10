import 'package:flutter/material.dart';
import 'package:thai_hotline_aapp/models/hotline_model.dart';
import 'package:url_launcher/url_launcher.dart';

 
class SubDHomeUi extends StatefulWidget {
  const SubDHomeUi({super.key});
 
  @override
  State<SubDHomeUi> createState() => _SubDHomeUiState();
}
 
class _SubDHomeUiState extends State<SubDHomeUi> {
  // ข้อมูลสายด่วนสาธารณูปโภค
  final List<HotlineModel> hotlineData = [
    HotlineModel(
      name: "การไฟฟ้าส่วนภูมิภาค",
      phone: "1129",
      image: "assets/images/f1.png",
    ),
    HotlineModel(
      name: "การไฟฟ้านครหลวง",
      phone: "1130",
      image: "assets/images/f2  .png",
    ),
    HotlineModel(
      name: "การไฟฟ้าฝ่ายผลิตฯ",
      phone: "1416",
      image: "assets/images/f3.png",
    ),
    HotlineModel(
      name: "การประปานครหลวง",
      phone: "1125",
      image: "assets/images/f4.png",
    ),
    HotlineModel(
      name: "การประปาส่วนภูมิภาค",
      phone: "1662",
      image: "assets/images/f5.png",
    ),
    HotlineModel(
      name: "true",
      phone: "1242",
      image: "assets/images/f6.png",
    ),
    HotlineModel(
      name: "dtac",
      phone: "1678",
      image: "assets/images/f7.png",
    ),
    HotlineModel(name: "AIS", 
    phone: "1175", 
    image: "assets/images/f8.png"
    ),
    HotlineModel(name: "TOT", 
    phone: "1100",
     image: "assets/images/f9.png"
     ),
  ];
 
  Future<void> _makePhoneCall(String phoneNumber) async {
    final cleanPhone = phoneNumber.replaceAll('-', '');
    final Uri launchUri = Uri(scheme: 'tel', path: cleanPhone);
    await launchUrl(launchUri);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 143, 172, 111),
      appBar: AppBar(
        title: const Text(
          "สายด่วนสาธารณูปโภค",
          style: TextStyle(fontWeight: FontWeight.bold),
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
                'assets/images/elec.jpeg',
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
 
 