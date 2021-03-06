import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/finance_flow/financemainquestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_taxx/datamodels/designfile.dart';

class FinanceDifferentOptionContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  String briefqstn;
  double containerSize;
  String bigQuestion;
  List answerOption = [];
  String additionalData;
  String multipleData;
  List suggestion;

  FinanceDifferentOptionContainer(
      {this.identity,
      this.bigQuestion,
      this.briefqstn,
      this.completeQuestion,
      this.questionOption,
      this.answerOption,
      this.containerSize,
      this.additionalData,
      this.multipleData,
      this.suggestion});
  @override
  _FinanceDifferentOptionContainerState createState() =>
      _FinanceDifferentOptionContainerState();
}

class _FinanceDifferentOptionContainerState
    extends State<FinanceDifferentOptionContainer> {
  bool open = false;
  bool v3 = false;
  Questions qu = Questions();
  final _formKey = GlobalKey<FormState>();
  Widget circleButton(IconData iconData) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        size: 30,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  void timer() {
    Timer(Duration(seconds: 1), () {
      print("Yeah, this line is printed after 3 second");
      setState(() {
        open = true;
      });
    });
  }
  //List<String> items = ["Employeed","Minijob(e.g 4.50 basis)","Studying","others","Employeed","Minijob(e.g 4.50 basis)","Studying","others",];

  //bool containerColor = false;

  @override
  Widget build(BuildContext context) {
    double minHeight = MediaQuery.of(context).size.height * .008;
    //double maxHeight = MediaQuery.of(context).size.height * .59;
    double maxHeight = widget.containerSize;
    return AnimatedContainer(
        duration: Duration(milliseconds: 800),
        height: open ? maxHeight : minHeight,
        width: MediaQuery.of(context).size.width,
//                    constraints: BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(right: 10, left: 10, top: 0),
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
                  Dismissible(
                    key: _formKey,
                    background: Container(
                      color: Color(0xFFf2f6ff),
                    ),
                    onDismissed: (DismissDirection direction) {
                      qu.FinanceAddAnswer(
                          widget.identity,
                          widget.bigQuestion,
                          widget.completeQuestion,
                          widget.questionOption,
                          ['skip'],
                          55.0);

                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FinanceMainQuestions(
                            CheckCompleteQuestion: widget.completeQuestion,
                            CheckQuestion: widget.questionOption,
                            CheckAnswer: ['skip']);
                      }));
                    },
                    child: Container(
                      height: 140,
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),
                                ),
                                height: 135.0,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Positioned(
                                  right:
                                      MediaQuery.of(context).size.width * 0.04,
                                  top: 7.0,
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Image(
                                        image: AssetImage(
                                            "images/question_mark.png"),
                                        width: questionMarkWidth,
                                        height: questionMarkHeight,
                                      ))),
                              Positioned(
                                  left:
                                      MediaQuery.of(context).size.width / 30.0,
                                  top: 30.0,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      widget.multipleData,
                                      style: TextStyle(
                                          fontSize: 12.5, color: Colors.black),
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
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 270.0,
                    width: 450.0,

//                                        color: Colors.red,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        child: ListView.builder(
                            itemCount: widget.answerOption.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    qu.FinanceAddAnswer(
                                        widget.identity,
                                        widget.bigQuestion,
                                        widget.completeQuestion,
                                        widget.questionOption,
                                        [widget.answerOption[index]],
                                        55.0);

                                    Navigator.of(context).pop();
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return FinanceMainQuestions(
                                          CheckCompleteQuestion:
                                              widget.completeQuestion,
                                          CheckQuestion: widget.questionOption,
                                          CheckAnswer: [
                                            widget.answerOption[index]
                                          ]);
                                    }));
                                  },
                                  child: Column(children: <Widget>[
                                    ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18.0),
                                        child: AutoSizeText(
                                          widget.answerOption[index],
                                          style: TextStyle(
                                              color: Color(0xFF003350)
                                                  .withOpacity(0.803),
                                              fontSize: 14.0,
                                              fontFamily: "HelveticaBold",
                                              fontWeight: FontWeight.bold),
                                          minFontSize: 14,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      height: 1.0,
                                    ),
                                  ]));
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
