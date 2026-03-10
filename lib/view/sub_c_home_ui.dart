import 'package:flutter/material.dart';
import 'package:thai_hotline_aapp/models/hotline_model.dart';
import 'package:url_launcher/url_launcher.dart';
 
class SubCHomeUi extends StatefulWidget {
  const SubCHomeUi({super.key});
 
  @override
  State<SubCHomeUi> createState() => _SubCHomeUiState();
}
 
class _SubCHomeUiState extends State<SubCHomeUi> {
  // ข้อมูลสายด่วนธนาคาร
  final List<HotlineModel> hotlineData = [
    HotlineModel(
      name: "ธนาคารกรุงเทพ",
      phone: "1333",
      image: "assets/images/b1.jpg",
    ),
    HotlineModel(
      name: "ธนาคารออมสิน",
      phone: "1115",
      image: "assets/images/b2.png",
    ),
    HotlineModel(
      name: "ธนาคารกสิกรไทย",
      phone: "02 888 8888",
      image: "assets/images/b3.png",
    ),
    HotlineModel(
      name: "ธนาคารกรุงไทย",
      phone: "02 111 1111",
      image: "assets/images/b4.png",
    ),
    HotlineModel(
      name: "ธนาคารกรุงศรีอยุธยา",
      phone: "1572",
      image: "assets/images/b5.png",
    ),
    HotlineModel(
      name: "ธนาคารทีเอ็มบีธนชาต",
      phone: "1428",
      image: "assets/images/b6.png",
    ),
    HotlineModel(
      name: "ธนาคารซิตี้แบงก์",
      phone: "1588",
      image: "assets/images/b7.png",
    ),
    HotlineModel(
      name: "ธนาคารแลนด์ แอนด์ เฮ้าส์",
      phone: "1327",
      image: "assets/images/b8.png",
    ),
    HotlineModel(
      name: "ธนาคารอาคารสงเคราะห์",
      phone: "02 645 9000",
      image: "assets/images/b9.png",
    ),
    HotlineModel(
      name: "ธนาคารไทยพาณิชย์",
      phone: "02 777 7777",
      image: "assets/images/b10.png",
    ),
    HotlineModel(
      name: "ธนาคารเกียรตินาคินภัทร",
      phone: "02 165 5555",
      image: "assets/images/b11.png",
    ),
    HotlineModel(
      name: "ธนาคารไทยเครดิต",
      phone: "02 697 5454",
      image: "assets/images/b12.png",
    ),
    HotlineModel(
      name: "ธนาคารยูโอบี",
      phone: "02 285 1555",
      image: "assets/images/b13.png",
    ),
    HotlineModel(
      name: "ธนาคารทิสโก้",
      phone: "02 633 6000",
      image: "assets/images/b14.png",
    ),
    HotlineModel(
      name: "ธนาคารอิสลามแห่งประเทศไทย",
      phone: "02 204 2766",
      image: "assets/images/b15.png",
    ),
    HotlineModel(
      name: "ธนาคารซีไอเอ็มบีไทย",
      phone: "02 626 7777",
      image: "assets/images/b16.png",
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
          "สายด่วนธนาคาร",
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
                'assets/images/bank.jpg',
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
 
 