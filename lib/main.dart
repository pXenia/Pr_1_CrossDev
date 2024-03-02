import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home:  Scaffold(
        body: Counter(),
        appBar: AppBar(title: Text("Практическая работа 3")),)
  ));
}

class Counter extends StatefulWidget{
  Counter({super.key});
  @override
  _CounterState createState() => _CounterState();
}
class _CounterState extends State<Counter>{
  String _name = "";
  String _sname = "";
  int _count = 0;

  _changeName(String text){
    setState(() => _name = text);
  }
  _changeAge(String sname){
    setState(() => _sname = sname);
  }
  _changeCount(){
    setState(() => _count += 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children:[
      const Text("Введите имя", style: TextStyle(fontSize: 20),),
      TextField(
          style: TextStyle(fontSize: 22),
          onChanged: _changeName),
      const Text("Введите фамилию", style: TextStyle(fontSize: 20)),
      TextField(
          style: TextStyle(fontSize: 22),
          onChanged: _changeAge),
      Row(children:[
        const Text("Оцените обслуживание: ", style: TextStyle(fontSize: 20)),
        Text(" $_count "),
        ElevatedButton(
            child: Text("+", style: TextStyle(fontSize: 22)),
            onPressed:(){_changeCount();}
        )
      ]),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          );
        },
        child: const Text('Завершить оценивание'),
      ),
    ]);
  }
}
class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Оценено!!!',),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://gas-kvas.com/uploads/posts/2023-02/1676439539_gas-kvas-com-p-risunok-detskoe-kafe-1.png"),
              Text("Спасибо за отзыв!"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Назад'),
              ),
            ],
          ),
        )
    );
  }
}

