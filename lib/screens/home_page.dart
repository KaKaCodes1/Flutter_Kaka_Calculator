import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget calcbutton(String btnText, Color btnColor, Color textColor){
    return Container(
      height: 75,
      width: 75,
      child: ElevatedButton(
        onPressed: () {
          
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: btnColor,
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 25,
          ),
          ),
      
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,//prevent this safearea from affecting bottom nav for android
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '0',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //here the first row of buttons
                  children: [
                    calcbutton('C',Colors.white10,Colors.red),
                    calcbutton('+/-',Colors.white10,Colors.green),
                    calcbutton('%',Colors.white10,Colors.green),
                    calcbutton('÷',Colors.white10,Colors.green),
                  ],
                ),
                const SizedBox(height: 10,),
                    
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //here the first row of buttons
                  children: [
                    calcbutton('7',Colors.white10,Colors.white),
                    calcbutton('8',Colors.white10,Colors.white),
                    calcbutton('9',Colors.white10,Colors.white),
                    calcbutton('x',Colors.white10,Colors.green),
                  ],
                ), 
                    
                const SizedBox(height: 10,),  
                    
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //here the first row of buttons
                  children: [
                    calcbutton('4',Colors.white10,Colors.white),
                    calcbutton('5',Colors.white10,Colors.white),
                    calcbutton('6',Colors.white10,Colors.white),
                    calcbutton('-',Colors.white10,Colors.green),
                  ],
                ), 
                    
                const SizedBox(height: 10,),
                    
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //here the first row of buttons
                  children: [
                    calcbutton('1',Colors.white10,Colors.white),
                    calcbutton('2',Colors.white10,Colors.white),
                    calcbutton('3',Colors.white10,Colors.white),
                    calcbutton('+',Colors.white10,Colors.green),
                  ],
                ), 
                    
                const SizedBox(height: 10,),
                    
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //here the first row of buttons
                  children: [
                    calcbutton('()',Colors.white10,Colors.white),
                    calcbutton('0',Colors.white10,Colors.white),
                    calcbutton('.',Colors.white10,Colors.white),
                    calcbutton('=',Colors.white10,Colors.green),
                  ],
                ), 
                    
                const SizedBox(height: 10,),                                                     
              ],
            ),
          ),
        ),
      ),
    );
  }
}