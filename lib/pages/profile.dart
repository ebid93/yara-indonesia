import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;
  TextEditingController _outputController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._outputController = new TextEditingController();
  }

  List<Widget> _children = [
    Scaffold(
      body: Text('Person'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () async {
          String barcode = await scanner.scan();
        },
        tooltip: "Scan qrcode",
        child: Icon(
          Icons.qr_code_scanner,
        ),
        backgroundColor: Colors.green,
      ),
    ),
    Scaffold(
      body: Text('Reward'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PT. Yara Indonesia'),
      ),
      body: _children.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              // ignore: deprecated_member_use
              title: Text('Person')),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              // ignore: deprecated_member_use
              title: Text('Reward')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    this._outputController.text = barcode;
  }
}
