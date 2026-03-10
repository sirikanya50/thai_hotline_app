import 'package:flutter/material.dart';
import 'package:thai_hotline_aapp/view/about_ui.dart';
import 'package:thai_hotline_aapp/view/sub_a_home_ui.dart';
import 'package:thai_hotline_aapp/view/sub_b_home_ui.dart';
import 'package:thai_hotline_aapp/view/sub_c_home_ui.dart';
import 'package:thai_hotline_aapp/view/sub_d_home_ui.dart';

 
class HomeUI extends StatefulWidget {
  const HomeUI({super.key});
 
  @override
  State<HomeUI> createState() => _HomeUIState();
}
 
class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const SubAHomeUi(),
    const SubBHomeUi(),
    const SubCHomeUi(),
    const SubDHomeUi(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('สายด่วน THAILAND'),
        backgroundColor: const Color.fromARGB(255, 13, 112, 35),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 247, 255, 247),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUI()),
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: const Color.fromARGB(255, 47, 153, 20),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_subway_filled_outlined),
            label: 'เดินทาง',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_outlined),
            label: 'เหตุฉุกเฉิน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_outlined),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home_work), 
          label: 'สาธาณูปโภค'
          ),
        ],
      ),
    );
  }
}
 
 