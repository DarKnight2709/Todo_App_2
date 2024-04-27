import 'package:flutter/material.dart';
import 'package:todo_app_2/constraints/colors.dart';
import 'package:todo_app_2/model/todo.dart';
import 'package:todo_app_2/widgets/todoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  List<Todo> toDoList = [
     Todo(title: "do exercise", onChecked: false),  Todo(title: "do homework", onChecked: false)
    ];

  List<Todo> tmp = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tmp = toDoList;
  }
    
  

  void onCheck(Todo todo){

    setState(() {
      todo.onChecked = !todo.onChecked;
    });
  }

  void _runFilter(String enteredKeyword) {
    List<Todo> list = [];
    if(!enteredKeyword.isEmpty){
      for(Todo todo in toDoList){
        if(todo.title.toLowerCase().contains(enteredKeyword)){
          list.add(todo);
        }
      }
      toDoList = list;
    }
    else{toDoList = tmp;} 
    setState(() {
      toDoList;
    });

  }

  void onRemove(Todo todo){
    setState(() {
      toDoList.remove(todo);
    });
  }

  void onAdd(TextEditingController controller){
    if(!_controller2.text.isEmpty) tmp.add(Todo(title: _controller.text, onChecked: false));
    if(_controller.text.contains(_controller2.text)) toDoList.add(Todo(title: _controller.text, onChecked: false));
    setState(() {
      toDoList;
      controller.clear();
    });
  
  }

  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: appBar(),
      body: Stack(
        
        children: [
           Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  padding: const EdgeInsets.all(10),
                
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                  
                  
                  child: 
                     TextField(
                          onChanged: (value) => _runFilter(value),
                          controller: _controller2,
                          decoration: const InputDecoration(
                            hintText: "Search",
                            prefixIcon:  Icon(Icons.search),
                            border: InputBorder.none,
                          )
                        ),
                    
                ),

               Container(
                margin: const EdgeInsets.only(top: 40, right: 20, left: 20,),
                child: 
                  Text("All ToDos", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),)),
               
              
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 120),
                    
                    children: [
                      for(Todo i in toDoList.reversed)
                        TodoTile(
                          onCheck: onCheck,
                          todo: i,
                          onRemove: onRemove,


                        )

                      
                    ],
                  ),
                )
              ],
            ),
         


          
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                  
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), 
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ]
                    ),
                    padding: const EdgeInsets.all(20),
      
                    margin: const EdgeInsets.only( left: 20),
                    child:
                       TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              hintText: "Add a new todo item",
                              border: InputBorder.none
                            )
                          ),
                        
                  
                      
                      
                  ),
                ),
                   Padding(

                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () => onAdd(_controller), 
                      style: ElevatedButton.styleFrom(
                      
                        backgroundColor: Colors.purple[100],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        minimumSize: Size(60, 60),
                        elevation: 10
                      ),
                      
                      child: const Icon(Icons.add), 
                    )
                   )
              ],
            ),
          )
        ],

      )

    );
  }
}


AppBar appBar(){
  return AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu, color: tdBlack, size: 30,),
            
             SizedBox(
               height: 40,
               width: 40,
               child: ClipOval(
                child: Image.asset("assets/ronaldo.jpg", fit: BoxFit.cover,),
                           ),
             )
            
          ],
        ),
      );
}




