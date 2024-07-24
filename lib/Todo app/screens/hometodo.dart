import 'package:flutter/material.dart';
import 'package:flutter_project1/Todo%20app/screens/taskdetails.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'date and time.dart';

// void main()async{
// await Hive.initFlutter();
// await Hive.openBox("todo_app_box");
// runApp(MaterialApp(debugShowCheckedModeBanner:false,home: HomeTodoApp(),));
// }


class HomeTodoApp extends StatefulWidget {


  @override
  State<HomeTodoApp> createState() => _HomeTodoAppState();
}

class _HomeTodoAppState extends State<HomeTodoApp> {

  void navigateToTaskDetail(String taskTitle, String taskContent, String dueDateTime) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TaskDetailPage(
          taskTitle: taskTitle,
          taskContent: taskContent,
          dueDateTime: dueDateTime,
        ),
      ),
    );
  }

  List<Map<String,dynamic>> todolist=[];
  final taskbox=Hive.box("todo_app_box");

  DateTime? taskDueDate;
  TimeOfDay? taskDueTime;




  @override
  void initState() {
    dateController.text="";
    timeController.text="";
   loadScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,color: Colors.black,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),
          SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined))
        ],
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Trace Span"),),
      body: todolist.isEmpty?
      Center(
        child: Text("welcome")
        // Lottie.asset("assets/anim/todohomeanim.json")
        )

          :  ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          final task = todolist[index];

          return Card(
            child: ListTile(
              title: Text(task["tasktitle"],style: TextStyle(fontWeight: FontWeight.bold),),


              trailing: Wrap(
                children: [

                  IconButton(onPressed: (){
                    showmytask(context,task['id']);
                  }, icon: Icon(Icons.edit),color: Colors.green,),
                  IconButton(onPressed: (){
                    deletemytask(task['id']);
                  }, icon: Icon(Icons.delete),color: Colors.red,)
                ],
              ),

      // Display task title here
              onTap: () {
                navigateToTaskDetail(
                  task["tasktitle"],
                  task["taskcontent"],
                  formatDueDateTime(task),
                );
              },
            ),
          );
        },
      ),





      floatingActionButton: FloatingActionButton.extended(backgroundColor: Colors.deepPurpleAccent, onPressed: ()=>
          showmytask(context,null),
          label: Text("Add Task"),
      icon: Icon(Icons.add),),
    );
  }

  final tasktitlecontroller=TextEditingController();
  final taskcontentcontroller=TextEditingController();
  final dateController=TextEditingController();
  final timeController=TextEditingController();


  void showmytask(BuildContext context, int? taskkey) async{

    // DateTime? localTaskDueDate;
    // TimeOfDay? localTaskDueTime;

  if(taskkey!=null) {
    final alreadyDonetask = todolist.firstWhere((element) =>
    element["id"] == taskkey);
    tasktitlecontroller.text = alreadyDonetask["tasktitle"];
    taskcontentcontroller.text = alreadyDonetask["taskcontent"];

  IconButton(onPressed: ()async{
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null) {
      setState(() {
        taskDueDate = selectedDate;
        dateController.text=selectedDate.toLocal().toString().split('d MMM, y')[0];
      });
    }
  }, icon: Icon(Icons.calendar_month));

  // Add a button to select the due time
  IconButton(
      onPressed: () async {
        final selectedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (selectedTime != null) {
          setState(() {
            taskDueTime = selectedTime;
            timeController.text=selectedTime.format(context);
          });
        }
      },
      icon: Icon(Icons.timer_outlined)
  );

  }else{
    tasktitlecontroller.text="";
    taskcontentcontroller.text="";
  }


  showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context){

        return Container(
          padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom+150
          ),
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: tasktitlecontroller,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Task Title"),
            ),
            SizedBox(height: 10,),
            
            TextField(
              controller: taskcontentcontroller,
              decoration: InputDecoration(border: OutlineInputBorder(),
                  hintText: "Write Task Here"),
            ),
            SizedBox(height: 10,),


            TextField(
              controller: dateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Due Date",
                icon: Icon(Icons.calendar_month)
              ),
              readOnly: true,
              onTap: () async {
                // Show date picker again when the date field is tapped
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: taskDueDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (selectedDate != null) {
                  setState(() {
                    taskDueDate = selectedDate;
                    dateController.text = selectedDate.toLocal().toString().split('d MMM, y')[0]; // Format date as needed
                  });
                }
              },
            ),
            SizedBox(height: 10),

            TextField(
              controller: timeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Due Time",
                icon: Icon(Icons.access_time)
              ),
              readOnly: true,
              onTap: () async {
                // Show time picker again when the time field is tapped
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: taskDueTime ?? TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  setState(() {
                    taskDueTime = selectedTime;
                    timeController.text = selectedTime.format(context); // Format time as needed
                  });
                }
              },
            ),




            SizedBox(height: 10,),

            ElevatedButton(onPressed: (){
              if(tasktitlecontroller.text!=""&&taskcontentcontroller.text!=""){
              if(taskkey==null){
                addnewTask({
                  "taskheading": tasktitlecontroller.text.trim(),
                  "taskbody": taskcontentcontroller.text.trim(),

                });
              }
              else{
              updatemyTask(
                taskkey,{
                "taskheading": tasktitlecontroller.text.trim(),
                "taskbody": taskcontentcontroller.text.trim(),

              });
              }
              }
              tasktitlecontroller.text="";
              taskcontentcontroller.text="";
              dateController.text="";
              timeController.text="";

              Navigator.of(context).pop();
            },
                child: Text(
                  taskkey==null? "Create Task": "Update Task"
                ))
          ],
        ),
        );
  });

  }
  Future<void>addnewTask(Map<String,dynamic> addingtask)async {

    //  dateTime(
    //   dueDate: taskDueDate,
    //   dueTime: taskDueTime,
    // );
    await taskbox.add(addingtask);
    loadScreen();
  }

  void updatemyTask(int? taskkey, Map<String, dynamic> updtask) async{
  await taskbox.put(taskkey, updtask);
  loadScreen();
  }

  void loadScreen() {
    final getTask=taskbox.keys.map((mykey) {
      final value = taskbox.get(mykey);
      return {
        "id": mykey,
        "tasktitle": value["taskheading"],
        "taskcontent": value["taskbody"],
      };
    }).toList();
    setState(() {
      todolist=getTask.reversed.toList();

    });
  }

  Future <void> deletemytask(int taskkey) async {
    await taskbox.delete(taskkey);
    loadScreen();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        content: Text("Task Deleted Successfully")));
  }

  // String formatDueDateTime() {
  //   if (taskDueDate != null && taskDueTime != null) {
  //     final dateStr = taskDueDate!.toLocal().toString().split(" ")[0];
  //     final timeStr = taskDueTime!.format(context);
  //     return '$dateStr $timeStr';
  //   }
  //   return 'No due date and time';
  // }

  String formatDueDateTime(Map<String, dynamic> task) {
    if (taskDueDate != null && taskDueTime != null) {
      final dateFormatter = DateFormat('d MMM, y');
      final timeFormatter = DateFormat('hh:mm a');
      final dateStr = dateFormatter.format(taskDueDate!);
      final timeStr = timeFormatter.format(DateTime(
        taskDueDate!.year,
        taskDueDate!.month,
        taskDueDate!.day,
        taskDueTime!.hour,
        taskDueTime!.minute,
      ));
      return '$dateStr  $timeStr';
    }
    return 'No due date and time';
  }



}
