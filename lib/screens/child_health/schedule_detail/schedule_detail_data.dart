import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pocket_health/bloc/child_health/schedule_detail/schedule_detail_bloc.dart';
import 'package:pocket_health/bloc/child_health/schedule_detail/schedule_detail_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_health/widgets/widget.dart';


class ScheduleDetailData extends StatefulWidget {
  const ScheduleDetailData({Key key}) : super(key: key);

  @override
  _ScheduleDetailDataState createState() => _ScheduleDetailDataState();
}

class _ScheduleDetailDataState extends State<ScheduleDetailData> {
  String dateOfBirth;
  String received;
  TextEditingController dob = new TextEditingController();
  TextEditingController name = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleDetailsBloc,ScheduleDetailsState>(
        builder: (BuildContext context,state){
          if(state is ScheduleDetailsInitial){
            return Container(color: Colors.green,height: 40,);
          }
          if(state is ScheduleDetailsLoaded){
            return Column(
              children: [
                Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(minHeight: 10.h),
                      child: ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.scheduleDetail.schedules.length,
                          itemBuilder: (BuildContext context,index){
                            final schedules = state.scheduleDetail.schedules[index];
                            var preDate = schedules.dueDate.toString();
                            var dates = DateTime.parse(preDate);
                            var formattedDate = "${dates.day}-${dates.month}-${dates.year}";
                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 5.0),
                                child: Column(
                                  children: [
                                    Card(
                                      child: Column(
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(minHeight: 10.h),
                                            decoration: BoxDecoration(
                                                color: Color(0xFF00FFFF),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(6.0),
                                                    topRight: Radius.circular(6.0))
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                      schedules.age
                                                  )
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8.0),
                                            child: Column(
                                              children: [
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount: schedules.vaccines.length,
                                                  itemBuilder: (BuildContext context,index){
                                                    final vaccines = schedules.vaccines[index];
                                                    return Container(
                                                        constraints: BoxConstraints(minHeight: 10.h),
                                                        child: Text("??? "+vaccines)
                                                    );
                                                  },
                                                ),
                                                Divider(color: Color(0xff163C4D)),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                  "Due Date:"
                                                              )
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                  formattedDate
                                                              )
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 8.h,),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                  "Date Received:"
                                                              )
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            decoration: dateInputDecoration(dateOfBirth),
                                                            controller: dob,
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                            onTap: (){
                                                              DatePicker.showDatePicker(context,
                                                                  showTitleActions: true,
                                                                  minTime: DateTime(1963, 3, 5),
                                                                  maxTime: DateTime(2021, 6, 7),
                                                                  onChanged: (date) {
                                                                    // print('change $date');
                                                                  }, onConfirm: (date) {
                                                                    // print('confirm $date');
                                                                    setState(() {
                                                                      var dob = date.toString();
                                                                      var dates = DateTime.parse(dob);
                                                                      var formattedDate = "${dates.day}-${dates.month}-${dates.year}";

                                                                      dateOfBirth = formattedDate;

                                                                      print(formattedDate);
                                                                    });
                                                                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                                                            },
                                                            child: Icon(Icons.date_range)
                                                        )

                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Divider(color: Color(0xff163C4D)),
                                                DropdownButtonFormField(
                                                  decoration: inputDeco("Received"),
                                                  hint: received == null
                                                      ? Text('')
                                                      : Text(
                                                    received,
                                                    style: TextStyle(color: Colors.deepOrange),
                                                  ),
                                                  isExpanded: true,
                                                  iconSize: 30.0,
                                                  style: TextStyle(color: Colors.deepOrange),
                                                  items: ['Received', 'Not Received',].map(
                                                        (val) {
                                                      return DropdownMenuItem<String>(
                                                        value: val,
                                                        child: Text(val),
                                                      );
                                                    },
                                                  ).toList(),
                                                  onChanged: (val) {
                                                    setState(
                                                          () {
                                                        received = val;
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    )


                  ],
                ),
              ],
            );
          }
          if(state is ScheduleDetailsError){
            return Container(color: Colors.red,height: 40,);
          }
          return Container(
              height: 50,
              child: Center(child: CircularProgressIndicator(backgroundColor: Colors.lightBlueAccent,)));
        }
    );

  }
}
