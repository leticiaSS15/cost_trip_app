import 'package:cost_trip/views/viagem_chekin.dart';
import 'package:cost_trip/views/viagem_planejada.dart';
import 'package:flutter/material.dart';

class MinhaViagem extends StatefulWidget {

  @override
  _MinhaViagemState createState() => _MinhaViagemState();
}

class _MinhaViagemState extends State<MinhaViagem> {

  final List<Widget> pags = [
    Container(
      child: (ViagemPlanejada()),
    ),
    Container(
      child: (ViagemCheckin()),
    )
  ];

  //bool _isLoading = true;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: pags[currentPage],
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.indigo,
              selectedItemColor: Colors.white,
              currentIndex: currentPage,
              items: [
                BottomNavigationBarItem(label: "Planejadas", icon: Icon(Icons.tapas_rounded)),
                BottomNavigationBarItem(label: "Check-In", icon: Icon(Icons.check_sharp)),
              ],
              onTap: (index){
                setState(() {
                  currentPage = index;
                });
              }
          )
      );
  }
}
