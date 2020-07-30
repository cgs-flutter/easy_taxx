import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
import 'package:easy_taxx/screens/questionsInQuestion.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/income_flow/incomemainquestions.dart';
import 'package:easy_taxx/datamodels/designfile.dart';

class CalculationContainerEmail extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String briefqstn;
  String bigQuestion;
  String additionalData;

  CalculationContainerEmail(
      {this.identity,
      this.bigQuestion,
      this.briefqstn,
      this.completeQuestion,
      this.questionOption,
      this.containerSize,
      this.additionalData});
  @override
  _Container7LState createState() => _Container7LState();
}

class _Container7LState extends State<CalculationContainerEmail> {
  TextEditingController calculations = TextEditingController();
  Questions qu = Questions();
  bool open = false;
  void timer() {
    Timer(Duration(seconds: 1), () {
      print("Yeah, this line is printed after 3 second");
      setState(() {
        open = true;
//        single=true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    double minHeight = MediaQuery.of(context).size.height * .004;
//    double maxHeight = MediaQuery
//        .of(context)
//        .size
//        .height * .3;

    //double maxHeight = 210.0;
    double maxHeight = widget.containerSize;
    // var maskTextInputFormatter = MaskTextInputFormatter(mask: "## / ## / ####");
//filter: { "#": RegExp(r'[0-9]')

    return AnimatedContainer(
        duration: Duration(milliseconds: 800),
        // height: open ? maxHeight : minHeight,
        height: 290,
        width: MediaQuery.of(context).size.width,
//                    constraints: BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 10.0, bottom: 0.0, right: 10, left: 10),
        decoration: BoxDecoration(
          //color: Colors.grey[200],
          color: Color(0xFFf2f6ff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: InkWell(
//                            onTap: () => setState(() => open = !open),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 210,
                    padding: EdgeInsets.only(top: 20),
                    // decoration: BoxDecoration(
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Color(0xFF38B6FF).withOpacity(1),
                    //       spreadRadius: 2,
                    //       blurRadius: 15,
                    //       offset: Offset(0,0), // changes position of shadow
                    //     ),
                    //   ],
                    // ),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color(0xFF84868C).withOpacity(0.3),
                              blurRadius: 4,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              // margin: EdgeInsets.only(left: 10.0,right: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),
                              ),
                              height: 340.0,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Positioned(
                                right: MediaQuery.of(context).size.width * 0.04,
                                top: 7.0,
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return questionInQuestion(
                                            widget.completeQuestion,
                                            widget.briefqstn);
                                      }));
                                    },
                                    child: Image(
                                      image: AssetImage(
                                          "images/question_mark.png"),
                                      width: questionMarkWidth,
                                      height: questionMarkHeight,
                                    ))),
                            Positioned(
                                left: MediaQuery.of(context).size.width / 30.0,
                                top: 30.0,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        color: Colors.black,
                                        wordSpacing: 3.0,
                                        height: 1.5),
                                  ),
                                )),
                            Positioned(
                              top: 52.0,
                              left: MediaQuery.of(context).size.width / 30.0,
                              right: MediaQuery.of(context).size.width / 30.0,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    widget.completeQuestion,
                                    style: TextStyle(
                                        fontSize: questionFontSize,
                                        color: Colors.white,
                                        wordSpacing: 3.0,
                                        fontFamily: "HelveticaBold",
                                        fontWeight: FontWeight.bold,
                                        height: 1.5),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  // Container(
                  //   //margin: EdgeInsets.only(top: 5.0),
                  //   height: 2.0,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: new BoxDecoration(boxShadow: [
                  //     new BoxShadow(
                  //       color: Colors.grey[300],
                  //       blurRadius: 0.8,

                  //     ),
                  //   ]),

                  // ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        color: Colors.white,
                        //margin: EdgeInsets.only(right: 60.0),
//                                      decoration: new BoxDecoration(boxShadow: [
//                                        new BoxShadow(
//                                          color: Colors.grey,
//                                          blurRadius: 5.0,
//                                        ),
//                                      ]),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                height: 50.0,
//                    color: Colors.wh,
                                child: TextFormField(
                                  controller: calculations,
                                  //inputFormatters: [maskTextInputFormatter],
                                  //keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          widget.additionalData == "calculation"
                                              ? "€0"
                                              : "example",
                                      contentPadding:
                                          EdgeInsets.only(left: 15.0)),
                                  keyboardType:
                                      widget.additionalData == "calculation"
                                          ? TextInputType.number
                                          : TextInputType.emailAddress,
                                )),
                            Container(
                              //margin: EdgeInsets.only(left: 20.0),
                              // color: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: GestureDetector(
                                onTap: () {
                                  AddData();
                                },
                                child: Text("Confirm",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            0XFF, 0X38, 0Xb6, 0XFF),
                                        fontFamily: "HelveticaBold",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            )));
  }

  void AddData() {
    print("ddate is" + calculations.text.toString());

    //print("Totals Domain is"+Questions.totalDomain.toString());
    qu.IncomeAddAnswer(
        widget.identity,
        widget.bigQuestion,
        widget.completeQuestion,
        widget.questionOption,
        [calculations.text.toString()],
        55.0);

    qu.addAnswer(widget.identity, "", widget.questionOption, [""], 55.0);
    print(widget.questionOption + " question opt");
    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return mainQuestions(
          CheckQuestion: widget.questionOption, CheckAnswer: [""]);
    }));
  }
}
