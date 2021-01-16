import 'package:flutter/material.dart';

import '../size_config.dart';

Widget appBarMain(BuildContext buildContext){
  return AppBar(
    title: Text("Ssential App"),
  );
}

Widget cardItem(String image, String text){
  return Container(
    height: 90,
    child: Padding(
      padding: const EdgeInsets.only(left:10,right: 10),
      child: Card(
        color: Color(0xFFFEEEF1),
        child: Row(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Image.asset(image, height: 40,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 20),
              child: Text( text,style: TextStyle(
                  color: Colors.black,
                  fontSize: 17
              ),
              ),
            ),


          ],
        ),
      ),
    ),
  );
}

InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
    contentPadding: new EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.black)
      ),

  );

}

InputDecoration searchFieldInputDecoration(String hintText){
  return InputDecoration(
    contentPadding: new EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
    hintText: hintText,
    prefixIcon: Icon(Icons.search,color: Colors.grey,),
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      borderSide: BorderSide(color: Color(0xFF00FFFF)),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: Color(0xFF00FFFF))
    ),

  );

}

BottomNavigationBarItem navBar (Icon icon,String label){
  return BottomNavigationBarItem(
    icon: icon,
    label: label,
  );
}


TextStyle simpleTextStyle(){
  return TextStyle(
      color: Colors.black,
      fontSize: 16
  );
}

TextStyle optionStyle =
TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

TextStyle mediumTextStyle() {
  return TextStyle(
      color: Colors.black,
      fontSize: 17
  );
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(icon),
            ),
            SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}




