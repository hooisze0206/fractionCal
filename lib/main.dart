import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _num1controller = TextEditingController();
  TextEditingController _num2controller = TextEditingController();
  TextEditingController _num3controller = TextEditingController();
  TextEditingController _num4controller = TextEditingController();
  int num1, num2, num3, num4;
  int numerator = 0, denominator =0, n, d;
  double total;
  var _operations = ['+', '-', 'x', '/'];
  var _operationSelected = '+';
  String data = '';
  List<DropdownButton<String>> menuItem = List();

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FractionCalculator',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          title: Text('Fraction Calculator'),
        ),
        body: Center(
           
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
           
          children: <Widget>[
            Container(
              
              decoration: BoxDecoration(
                color: Colors.white,
              border: Border.all(color: Colors.blueAccent,
              width: 2.0)
              ),
            child: Column(children: <Widget>[
              Text('      X      ',
              style: new TextStyle(
                          color: Colors.black, 
                          fontSize: 25.0),),
              Text('___'),
              Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text('Y',
              style: new TextStyle(
                          color: Colors.black, 
                          fontSize: 25.0),),),
              
          ],),),
          SizedBox(height: 30),

            Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: _num1controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,                           
                          ),
                        ),
                        hintText: 'Numerator 1',
                      ), 
                      keyboardType: TextInputType.numberWithOptions(),                    
                    ),
                  ),
                ),
                SizedBox(width: 40),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: _num3controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Numerator 2',
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                ),
                
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 6),
                  child: Text("_____________________"),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 5, 6),
                    child: DropdownButton<String>(
                      items: _operations.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      iconSize: 30.0,
                      onChanged: (String _value) {
                        setState(() {
                          this._operationSelected = _value;
                        });
                      },
                      value: _operationSelected,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 6),
                  child: Text("_____________________"),
                ),
                
                
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: _num2controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),                         
                        ),
                        hintText: 'Denomenator 1',
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                ),
                SizedBox(width: 40),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: _num4controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Denomenator 2',
                      ),keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                ),
                
              ],
            ),

            
            SizedBox(height: 20),
          
            Row(mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text("="),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: Column(children: <Widget>[
                    
                      Text("$numerator",
                        style: new TextStyle(
                          color: Colors.lightBlue, 
                          fontSize: 25.0),),
                      Text("____"),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                        child: Text("$denominator",
                        style: new TextStyle(
                          color: Colors.lightBlue, 
                          fontSize: 25.0),
                      ),
                )]),),
            ],),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: FlatButton.icon(
                  color: Colors.lightGreen,
                  label: Text('Calculate'),
                  icon: Icon(Icons.play_circle_filled),
                  onPressed: calculate,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: RaisedButton(onPressed: _onClear, child: Text('Clear')),
              ),
            ]),

            
          ]),
        ),
      ),
    );
  }

  _onClear() {
    setState(() {
      _num1controller.text = "";
      _num2controller.text = "";
      _num3controller.text = "";
      _num4controller.text = "";
    });
  }//method to clear the textfield

  void calculate() {
    setState(() {
      data = _operationSelected;
    });
    num1 = int.parse(_num1controller.text);
    num2 = int.parse(_num2controller.text);
    num3 = int.parse(_num3controller.text);
    num4 = int.parse(_num4controller.text);
    if (data == "+") {
      numerator = (num1 * num4) + (num2 * num3);
      denominator = num2 * num4;
    } else if (data == "-") {
      numerator = (num1 * num4) - (num2 * num3);
      denominator = num2 * num4;
    } else if (data == "x") {
      numerator = num1 * num3;
      denominator = num2 * num4;
    } else if (data == "/") {
      numerator = num1 * num4;
      denominator = num2 * num3;
    }
  }//method to get the operation that is selected and print out the ouput
}
