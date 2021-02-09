import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_format/date_format.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_manager/Util/Color.dart';
import 'package:task_manager/Modal/Task.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Task extends StatefulWidget {
   
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
 
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();
   void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(_selectedValue.toString()),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search),
          ),
           IconButton(
            onPressed: (){},
            icon: Icon(FontAwesomeIcons.slidersH),
          )
        ],
      ),
       body: Container(
        
         child: ListView(
           children: [
             Container(
                
               child: buildHeaderColumn(context),
             )
             
           ],
         ),
       )
    );
  }

  Column buildHeaderColumn(BuildContext context) {
    return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 buildFirstHeaderColumn(context),
                 SizedBox(height: 20.0,),
                buildSecondColumn(context)
               ]
             );
  }

  Widget buildSecondColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15.0),
                      child: Text(
                        "Task",
                        style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ),
               Container( 
                    child:Column(
                    children: 
                      taskModel.asMap().entries.map((MapEntry map) => 
                      _buildTaskList(map.key)
                      ).toList(),
                    )),
                  ],
                ),
    );
  }

  Container buildFirstHeaderColumn(BuildContext context) {
    return Container(
                 padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 30.0),
                 decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0)
            )
            ),
                 child: Column(
                   children: [
                     buildHeader(context),
                     buildDateList(context),
                   ],
                 ),
               );
  }

  Widget buildDateList(BuildContext context) {
    return Container(
             decoration: BoxDecoration( 
               borderRadius: BorderRadius.circular(30.0)
             ),
              child: DatePicker(
                DateTime.now(),
                width: 60,
                height: 90,
                controller: _controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: Theme.of(context).accentColor,
                selectedTextColor: Theme.of(context).primaryColor,
                inactiveDates: [
                  DateTime.now().add(Duration(days: 3)),
                  DateTime.now().add(Duration(days: 4)),
                  DateTime.now().add(Duration(days: 10))
                ],
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedValue = date;
                  });
                },
              ),
     );
  }

  

 Widget buildHeader(BuildContext context) {
   return Container(
            margin: EdgeInsets.symmetric(vertical:10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   formatDate(_selectedValue, [M, ', ', yyyy]),
                 
                   style: Theme.of(context).textTheme.headline2.copyWith(
                     color:Colors.black,
                     fontSize: 28.0,
                     fontWeight: FontWeight.bold
                     )
                 ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context,'/addtask');
                    },
                                      child: Chip(
                      label: Text(
                        "+ Add Task",
                        style:Theme.of(context).textTheme.bodyText1
                        ),
                        backgroundColor: Theme.of(context).accentColor,
                    ),
                  ), 
               ],
             ),
           );
 }


  Widget _buildTaskList(int index) {
     return Container(
               margin: EdgeInsets.symmetric(vertical:10.0),
              height: 90.0, 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0,3),
                  spreadRadius: 0.4,
                  blurRadius: 8.0

                )]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                   alignment: Alignment.center,
                    width: 60.0,
                    height: MediaQuery.of(context).size.height, 
                    child: FaIcon(FontAwesomeIcons.clipboardList, color: Colors.white, size: 30.0,),
                    // child: Icon(Icons.note),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                       color: Color(AppColors.secondaryColor),
                    ),
                  ),
                  Expanded(
                          child: Container( 
                            padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              // padding: EdgeInsets.symmetric(vertical:5.0),
                            child: Text(
                              taskModel[index].name,  
                              style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                          ),
                           Container(
                              padding: EdgeInsets.symmetric(vertical:5.0),
                            child: Text( 
                              taskModel[index].date,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color(AppColors.headerText2), fontSize: 12.0)),
                          ) 
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(Icons.more_vert),
                  )
                ],
              ),
            );
  }
}


 
