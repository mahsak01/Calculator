import 'package:calculator/models/sign.dart';
import 'package:stack/stack.dart';
class Calculation{
  //input
  double result=0;
  String? _input;
  List<String> _list=[];
  List<Sign> sign=[Sign("-", 1),Sign("+", 1),Sign("%", 3),Sign("/", 3),Sign("x", 3)];
  void setInput(String s){
    if (!s.isEmpty){
      this._input=s;
      splite();
      setResult();
    }

  }

  void splite(){
    String temp="";
    for (int i=0 ; i<_input!.length ; i++){
       if(checkSign(_input![i])){
         if(!temp.isEmpty)
            _list.add(temp);
         temp="";
         _list.add(_input![i]);
       }
       else
         temp+=_input![i];
    }
    if (!temp.isEmpty)
      _list.add(temp);

  }
  void setResult(){
    List temp=convertToPostfix();
    Stack<String> stack = Stack<String>();
    for(int i= 0 ; i<temp.length  ; i++) {
       if(checkSign(temp[i])){
         String n2=stack.pop();
         if(stack.isEmpty)
           stack.push(calculation(0, double.parse(n2), temp[i]).toString());
         else
           stack.push(calculation(double.parse(stack.pop()), double.parse(n2), temp[i]).toString());
       }
       else
         stack.push(temp[i]);
    }
    this.result=double.parse(stack.pop());
    }

  double calculation(double n1 ,double n2 , String temp ){
     switch(temp){
       case "+":
         return sum(n1, n2);
       case "-":
         return diff(n1, n2);
       case "x":
         return multi(n1, n2);
       case "/":
         return div(n1, n2);
       case "%":
         return perc(n2);
     }
     return 0;
  }

  bool checkSign(String input){
    if(searchValue(input)!=-1)
      return true;
    return false;
  }

  int? searchValue(String temp){
    for(int i = 0 ; i<sign.length ; i++){
      if(sign[i].sign!.compareTo(temp)==0)
        return sign[i].value;
    }
    return -1;
  }

   List<String> convertToPostfix(){
    List<String> temp=[];
    Stack<String> stack = Stack<String>();
    for(int i= 0 ; i<_list.length  ; i++){
      if(searchValue(_list[i])!=-1){
        // if()
         while(!stack.isEmpty&&searchValue(_list[i])!<=searchValue(stack.top())!){
           temp.add(stack.pop());
         }
         stack.push(_list[i]);
      }else{
        temp.add(_list[i]);
      }
    }
    while(!stack.isEmpty){
      temp.add(stack.pop());
    }
    return temp;
   }

   double perc(double n)=> n /100;
  double div(double n1 , double n2)=> n1 / n2;
  double multi(double n1 , double n2)=> n1 * n2;
  double diff(double n1 , double n2)=> n1 - n2;
  double sum(double n1 , double n2)=> n1 + n2;
}