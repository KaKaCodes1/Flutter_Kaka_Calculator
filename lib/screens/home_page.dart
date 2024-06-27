import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';//to enable parsing and evaluting 
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _expression = ''; //stores the mathematical expression
  String _result = ''; //stores the answer
  int maxExpressionLength = 20;//define the maximum characters on the expression

  Widget calcbutton(String btnText, Color btnColor, Color textColor){
    // ignore: sized_box_for_whitespace
    return Container(
      height: 75,
      width: 75,
      child: ElevatedButton(
        onPressed: () {
          _onButtonPressed(btnText);
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
  //creating the functionality of the buttons
  void _onButtonPressed(String btnText){
    setState(() {
      if(btnText == 'C'){//making the clear button functional on pressed
        _expression= '';
        _result=' ';
       
      }
      else if(btnText == '='){//making the equal sign able to calculate on pressed
        _calculateResult();
      }
      else if(btnText == '+/-'){//it toggles the sign of the current expression.
        _changeSign();
      }
      else if(btnText == '()'){
        _addWhichParenthesis();
      }

      else{//whatever will be pressed will be displayed
        if(_expression.length + btnText.length <= maxExpressionLength){
          _expression += btnText;
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                "Can't enter more than 20 characters!",
                textAlign: TextAlign.center,
                ),
              // backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
              // width: 200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              elevation: 10.0,
              behavior: SnackBarBehavior.floating,
              //width: MediaQuery.of(context).size.width * 0.7, // 80% of the screen width
              
            ),
          );
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Builder(
          //       builder: (context) => Container(
          //         width: MediaQuery.of(context).size.width * 0.8, // 80% of the screen width
          //         child: const Text(
          //           "Can't enter more than 20 characters!",
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             fontSize:15,
          //           ),
                    
          //         ),
          //       ),
          //     ),
          //     duration: const Duration(seconds: 2),
          //     behavior: SnackBarBehavior.floating,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(24),
          //     ),
          //     elevation: 6.0,
          //   ),
          // );          
        }
      }      
    });
  }

  //This method evaluates the expression to provide the result using math_expressions package
  void _calculateResult(){
    try {
      Parser p = Parser();//to convert text into a mathematical expression
      Expression exp = p.parse(_expression.replaceAll('x', '*').replaceAll('÷', '/'));//It replaces 'x' with '*' and '÷' with '/' to match Dart's arithmetic operators
      ContextModel cm =ContextModel();//This provides a mathematical context of the parsed text
      double eval = exp.evaluate(EvaluationType.REAL, cm);// Evaluate the expression in the context of real numbers
      _result = eval.toString();

    } catch (e) {
      _result = 'Error';
    }
  }

  //The method that will make +/- fuctional, to make use of negative integers
  void _changeSign(){
    if (_expression.isNotEmpty){
      if(_expression.startsWith('-')){
        _expression=_expression.substring(1);
      }
      else{
        _expression = '-$_expression';
      }
    }
  }

  void _addWhichParenthesis() {
    if (_expression.isEmpty || _expression.endsWith('+') || _expression.endsWith('-') || _expression.endsWith('x') || _expression.endsWith('÷') || _expression.endsWith('%')){
      _expression += '(';
    }
    else if (_expression.endsWith('(') || _expression.endsWith(')') || _expression.endsWith('.') || _expression.endsWith('0') || _expression.endsWith('1') || _expression.endsWith('2') || _expression.endsWith('3') || _expression.endsWith('4') || _expression.endsWith('5') || _expression.endsWith('6') || _expression.endsWith('7') || _expression.endsWith('8') || _expression.endsWith('9')) {
       _expression += ')';
    }
  }

    void _backspace() {
      setState(() {
        if(_expression.isNotEmpty){
          _expression = _expression.substring(0, _expression.length - 1);
        }
      });
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
                //this where the expression will appear
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          _expression,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        _result,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        onPressed: () {
                          _backspace();
                        }, 
                        icon: const Icon(Icons.cancel_outlined, color: Colors.red,)
                        ),
                    )
                  ],
                ),

                const Divider(
                  color: Colors.white,
                  thickness: 0.5,
                  height: 10,
                  indent: 20,
                  endIndent: 20,
                ),

                const SizedBox(height: 10,),

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