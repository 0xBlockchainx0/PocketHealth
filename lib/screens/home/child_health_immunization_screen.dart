import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pocket_health/screens/child_health/unwell_child_screen.dart';
import 'package:pocket_health/widgets/child_card_item.dart';

class CHIScreen extends StatefulWidget {
  const CHIScreen({Key key}) : super(key: key);

  @override
  _CHIScreenState createState() => _CHIScreenState();
}

class _CHIScreenState extends State<CHIScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAFCF6),
      appBar: AppBar(
        title: Text("Child Health & Immunization",style: TextStyle(fontSize: 18),),
        backgroundColor: Color(0xFF00FFFF),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
            children: [
              ChildCardItem(image: "assets/images/child_unwell.png", press: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UnwellChildScreen()));
              }),
              ChildCardItem(image: "assets/images/immunisation_chart.png", press: (){}),
              ChildCardItem(image: "assets/images/growth_and_milestones.png", press: (){}),
              // ChildCardItem(image: "assets/images/child_nutrition.png", press: (){}),
              ChildCardItem(image: "assets/images/chronic_conditions.png", press: (){}),
              ChildCardItem(image: "assets/images/child_resource.png", press: (){}),


            ],
          ),
      ),

    );
  }
}
