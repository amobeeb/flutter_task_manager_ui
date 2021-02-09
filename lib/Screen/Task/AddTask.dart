import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:date_time_format/date_time_format.dart';
class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController startTimeCtl = TextEditingController();

   final taskCategory = ['Marketing', 'Meeting', 'Production', 'UI Design'];
   int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Create New Task", style: TextStyle(fontSize: 16.0),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
           IconButton(
            onPressed: (){},
            icon: Icon(FontAwesomeIcons.slidersH),
            color: Colors.white
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).accentColor,
        child: ListView(
            children: [
              buildFormContainer(),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)
                  ),
                  color: Colors.white
                ),

                child: Column(
                  children: [
                      Container( 
                         padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 30.0),
                         
                        child: Form(
                          key: _formKey2,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                   buildTimeTextForm(context, "Start Time"),
                                   buildTimeTextForm(context, "End Time"), 
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical:20.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Description",
                                    labelStyle: TextStyle(
                                      color: Colors.black
                                    )
                                  ),
                                  keyboardType: TextInputType.streetAddress,
                                ),
                              ),
                              Text(
                                "Cateregory"
                              ),
                               Container(
                              child: Wrap(
                                children: [
                                  for(int i=0; i<taskCategory.length; i++) 
                                    
                                   Container(
                                     margin: EdgeInsets.symmetric(horizontal:10.0, vertical: 1.0),
                                     child: ChoiceChip(
                                        label: Text(taskCategory[i]),
                                        selected: _value==i,
                                        selectedColor: Theme.of(context).accentColor,
                                        labelStyle: TextStyle(
                                          color:_value==i?  Colors.white:Colors.black,
                                          fontSize: 16.0
                                        ),

                                        onSelected: (bool selected){
                                          setState(() {
                                            _value = selected ? i : null;
                                            print(_value);
                                          });
                                        },
                                      ),
                                   )
                                  
                                ],
                              ),
                            )

                            ],
                          ),

                        ),
                      )
                  ],
                ),
              )
            ],
        ),
      ),
      
    );
  }

  buildTimeTextForm(BuildContext context, title)  {
    return Container(
      
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                onTap: () async{
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                    TimeOfDay startTime = new TimeOfDay.now();
                                    startTime = await showTimePicker(
                                        context: context, 
                                        initialTime:  TimeOfDay.now(), 
                                        );
                                    setState(() { 
                                      var localizations = MaterialLocalizations.of(context);
                                       startTimeCtl.text =  localizations.formatTimeOfDay(startTime);
                                    });
                                },
                              decoration: InputDecoration(
                                labelText: title,
                                border: InputBorder.none
                              ),
                              controller: startTimeCtl,

                          ),
                            );
  }

  Container buildFormContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 30.0),
              child:   Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Title",
                        labelText: 'Title', 
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ), 
                      ),
                      style: TextStyle(
                          color: Colors.white,
                        ),
                      keyboardType: TextInputType.text,
                    ),
 
                    TextFormField(
                      onTap: ()async{
                        FocusScope.of(context).requestFocus(new FocusNode());
                        DateTime date = DateTime(1990);
                        date = await showDatePicker(context: context, 
                        initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                        setState(() {
                          
                           dateCtl.text =  new DateFormat("EEEE, dd, M, yyyy").format(date); 
                        });
                       
                      },
                      controller: dateCtl,
                      decoration: InputDecoration(
                        hintText: "Enter Date",
                        labelText: 'Date',
                          labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ), 
                      ),
                      style: TextStyle(
                          color: Colors.white,
                        ),
                      keyboardType: TextInputType.datetime,
                    ),
                   
                  ],
                ),
              )
            );
  }
}