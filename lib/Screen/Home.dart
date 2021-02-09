
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_manager/Modal/Task.dart';
import 'package:task_manager/Util/Color.dart';

class Home extends StatefulWidget {
@override
_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(

leading: Icon(Icons.menu),
actions: [
  ClipRRect(
    borderRadius: BorderRadius.circular(50.0),
    child: Image(
      image:AssetImage("assets/images/15.jpeg")
    ),
  ),
    
],
),
body: Container(
  margin: EdgeInsets.symmetric(horizontal:20.0),
child: ListView(
  children: [
    _headerWidget(context),
    Container(
        child: Row(
          children: [
            _menu(pagename:'My tasks', routename:'/task', isActive: 1, context: context),
            SizedBox(width: 20.0),
            _menu(pagename:'Projects',isActive: 0, context: context),
            SizedBox(width: 20.0),
            _menu(pagename:'Notes',isActive: 0, context: context)
          ],
        )

    ),
    Container(
      margin: EdgeInsets.symmetric(vertical:20.0),
      height: 230,
      child:  _mainCarousel()
    ),
    SizedBox(height: 20.0,),
    Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 15.0),
      child: Text(
        "Progress",
        style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black),
        )
      ),
    Container(
      // margin: ,
      
      child:Column(
        children: 
          taskModel.asMap().entries.map((MapEntry map) => 
          _buildTaskList(map.key)
          ).toList()
          ,
      )
      // ListView.builder(
      //   itemCount: taskModel.length,
      //   scrollDirection: Axis.vertical,
      //   shrinkWrap: true,
      //   itemBuilder: (context, index){
      //     return _buildTaskList(context, index);
      //   },
      // ),
    )

  ],
),
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
              borderRadius: BorderRadius.circular(20.0),
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


Widget _headerWidget(context){
return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              child:Text(
                'Hello,',
                style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Colors.black
                ),
                )
            ),
            SizedBox(width: 4.0,),
            Container(
              child:Text(
                'Dammy!',
                style: Theme.of(context).textTheme.headline1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
                )
            )
          ],
        ),
        Container(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 25.0),
              child:Text(
                'Have a nice day!',
                style: Theme.of(context).textTheme.headline2.copyWith(
                  fontWeight: FontWeight.w600
                ),
                )
            )
      ],
    );
}

Widget _menu({String pagename, String routename='/', isActive, context}){
return Container( 
child: GestureDetector(
onTap: (){
Navigator.pushNamed(context, '/task');
},
  child: Chip(
padding: EdgeInsets.symmetric(horizontal:10.0),
backgroundColor: isActive==1?Color(AppColors.secondaryColor):Color(0xffDFE9F5),
    label: Text(
      pagename,
      style:isActive==1?Theme.of(context).textTheme.bodyText1:Theme.of(context).textTheme.bodyText1.copyWith(color:Colors.black) 
    ),
),
),
);
}
Widget  _mainCarousel(){
return ListView.builder(
        itemCount: taskModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            height: 230,
            width: 180,
            decoration: BoxDecoration(
              color: Color(AppColors.secondaryColor),
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Container( 
              margin: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child:Text(
                      taskModel[index].date,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize:11.0, 
                      ),
                    )
                  ),
                  Container(
                      height: 60,
                    margin: EdgeInsets.symmetric(vertical: 40.0),
                    alignment: Alignment.centerLeft,
                    child:Text(
                      taskModel[index].name,
                      style:  Theme.of(context).textTheme.bodyText2.copyWith(
                        height: 1.5
                      )
                      )
                  ),
                  Column(
                    children: [
                      Container(
                      padding: EdgeInsets.symmetric(horizontal:10.0),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Progress',
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize:11.0, 
                          ),),
                            Text('80%',
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize:11.0, 
                          ),),
                          ],
                        )
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 0.0),
                        child:new LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 2.0,
                        percent: 0.5,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.white,
                      ),
                      ),
                    ],
                  ),

                  
                ],
              ),
            ),
          );

        },
        );
}
}