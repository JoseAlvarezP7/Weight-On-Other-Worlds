import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _weightController = new TextEditingController();

  String result = "";
  String result1 = "";
  String result2 = "";

  // Source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html

  double mercury = 0.38;
  double venus = 0.91;
  double earth = 1.00;
  double mars = 0.38;
  double jupiter = 2.34;
  double saturn = 1.06;
  double uranus = 0.92;
  double neptune = 1.19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 25, top: 50, bottom: 25),
                  child: text1(
                      'Your Weight \nOn Other Worlds', 45, FontWeight.w500),
                ),
              ),
              Container(
                height: 485,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //EarthCard(),
                    //MercuryCard(),
                    //MarsCard(),
                    _card1('Tierra', 'assets/images/earth.png'),
                    _card2('Jupiter', 'assets/images/jupiter.png', result),
                    _card2('Mars', 'assets/images/mars.png', result1),
                    _card2('Saturn', 'assets/images/saturn.png', result2),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _card1(
    String planetName,
    String assetImage,
  ) {
    return Container(
        height: 450,
        margin: EdgeInsets.only(left: 45),
        child: Stack(
          children: [
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 60),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () => {},
                  child: Container(
                    width: 290,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                assetsimage(assetImage),
                Container(
                  padding: EdgeInsets.only(left: 55),
                  child: Column(
                    children: [
                      text1(planetName, 40.0, FontWeight.w500),
                      text1('Planet', 20.0, FontWeight.w500),
                      SizedBox(height: 20),
                      text1('Your weight in Kg', 20, FontWeight.w500),
                      textfield(),
                      button(),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  _card2(
    String planetName,
    String assetImage,
    String weightPlanet,
  ) {
    return Container(
        height: 450,
        margin: EdgeInsets.only(left: 45),
        child: Stack(
          children: [
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 60),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () => {},
                  child: Container(
                    width: 290,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                assetsimage(assetImage),
                Container(
                  padding: EdgeInsets.only(left: 55),
                  child: Column(
                    children: [
                      text1(planetName, 40.0, FontWeight.w500),
                      text1('Planet', 20.0, FontWeight.w500),
                      SizedBox(height: 20),
                      text1('Your weight is ', 20, FontWeight.w500),
                      SizedBox(height: 20),
                      text1(weightPlanet + ' kg', 30, FontWeight.w400),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget text1(String _planet, double _fontSize, FontWeight _fontWeight) {
    return Text(
      _planet,
      style: TextStyle(
        color: Colors.white,
        fontSize: _fontSize,
        fontWeight: _fontWeight,
      ),
    );
  }

  Widget textfield() {
    return Container(
      width: 150,
      child: TextField(
        controller: _weightController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        cursorColor: Colors.white,
        cursorWidth: 3,
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
            hintText: 'Please enter weight',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            )),
      ),
    );
  }

  Widget button() {
    return ElevatedButton(
        onPressed: () {
          calculate(double.parse(_weightController.text), mercury);
        },
        child: Text('Calculate'),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF1B1B33),
        ));
  }

  Widget assetsimage(String _assetsimage) {
    return Padding(
      padding: EdgeInsets.only(left: 55),
      child: Center(
        child: Container(
          height: 180,
          width: 180,
          child: ClipRRect(
            child: Image.asset(_assetsimage),
          ),
        ),
      ),
    );
  }

  void calculate(double weight, double weightPlanet) {
    double _result = weight * jupiter;
    double _result1 = weight * mars;
    double _result2 = weight * saturn;
    String kg = _result.toStringAsFixed(2);
    String kg1 = _result1.toStringAsFixed(2);
    String kg2 = _result2.toStringAsFixed(2);
    setState(() {
      result = kg;
      result1 = kg1;
      result2 = kg2;
    });
  }
}
