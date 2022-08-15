import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/services/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'ui/theme.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController gettingText = TextEditingController();
  int totalScore=0;
  List scoreList=["Score"];
  List gameName=["Game"];
  int counter=0;
  List scorePoint=["point"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body:SingleChildScrollView(
        child: SizedBox(
        height:MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _addTaskBar(),
              _addNewScore(),
            ],
          ),
        ),
      )
    );
  }
_appBar(BuildContext context){
  return AppBar(
    backgroundColor: context.theme.backgroundColor,
    elevation: 0,
    leading: GestureDetector(
      onTap: () {
        ThemeServices().switchTheme();
      },
      child: Icon(Get.isDarkMode?Icons.wb_sunny_outlined:Icons.nightlight_round,
      size: 25,
      color: !Get.isDarkMode?primaryClr:secColor,),
      
    ),
    actions: [IconButton(
                  onPressed: (){
                    setState(() {
                      Get.to(const MyProfile());
                    });
                  }, 
                  icon:const Icon(Icons.person),
                  color: !Get.isDarkMode?primaryClr:secColor,),],
  );
}
_addTaskBar(){
        return Container(
          width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _titleContainer(secColor, primaryClr, secColor, DateFormat.yMMMMd().format(DateTime.now()), "Today"),
                _titleContainer(primaryClr, secColor, primaryClr, "Total Score:", totalScore.toString()),
                       ],
                        ),
                           );}
_addNewScore() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                  Text("Score Table",
                    style:_subTitleStyle(!Get.isDarkMode?primaryClr:secColor)),
                    const SizedBox(height: 5,),  
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                      height: 135,
                      width: double.infinity,
                      decoration: BoxDecoration(
                      color: !Get.isDarkMode?primaryClr:secColor,
                      border: Border.all(
                        color:!Get.isDarkMode?primaryClr:secColor,
                        width: 1,),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:const [
                        BoxShadow(
                          blurRadius: 6,
                          color: Color.fromARGB(170, 131, 245, 245)
                          ,
                          offset: Offset(0,0)
                        )
                        
                      ], 
                      ),
                      child: ListView.builder(
                        itemCount: scoreList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Container(
                            alignment: Alignment.center,
                            width: 50,
                            padding:const EdgeInsets.only(top:14),
                            margin:const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color:index%5==0? Color.fromARGB(222, 93, 120, 125):Get.isDarkMode?primaryClr:secColor,
                              border: Border.all(
                              color:Color.fromARGB(170, 5, 86, 86),
                              width: 1,),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                  Text(gameName[index].toString(),
                                  style: _titleStyle(!Get.isDarkMode?primaryClr:secColor)),
                                   Divider(thickness: 1,color: !Get.isDarkMode?primaryClr:secColor,),
                                  scorePoint[index]=="0"? Divider(thickness:1,indent: 10,endIndent:10,color: !Get.isDarkMode?primaryClr:secColor,):
                                  Text(scorePoint[index].toString(),
                                  style: _titleStyle(!Get.isDarkMode?primaryClr:secColor)),
                                  
                                  Divider(thickness: 1,color: !Get.isDarkMode?primaryClr:secColor,),
                                  Text(scoreList[index].toString(),
                                  style: _titleStyle(!Get.isDarkMode?primaryClr:secColor)
                                  ),
                                        ], ));
                        }),
                    ),
              const SizedBox(height: 10,),
              TextField( 
                cursorColor: !Get.isDarkMode?primaryClr:secColor,
                keyboardType: TextInputType.number,
                      controller: gettingText,
                      decoration: InputDecoration( 
                        iconColor: !Get.isDarkMode?primaryClr:secColor,
                          prefixIcon: Icon(
                            Icons.calculate_outlined,
                            color: !Get.isDarkMode?primaryClr:secColor,),
                          labelText: "Type Your Point",
                          labelStyle: TextStyle(
                            color: !Get.isDarkMode?primaryClr:secColor
                          ),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                      )
                    ),
              const SizedBox(height: 10,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: 
                [
                     _buttonField("Dinar",10,1),
                     _buttonField("Shix", 75,2),
                     _buttonField("Banat",25,3),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                      _buttonField("Latosh",15,4),
                      _buttonField("Trix",25,5),
                      _buttonField("Clear",25,0),
                   
                ],),
                const SizedBox(height: 15,),
              SlideAction(
                        elevation: 20,
                        height: 40,
                        borderRadius: 5,
                        innerColor:Get.isDarkMode?primaryClr:secColor ,
                        outerColor:!Get.isDarkMode?primaryClr:secColor,
                        sliderButtonIcon: Icon(Icons.recycling_outlined,
                                                color:!Get.isDarkMode?primaryClr:secColor,
                                                size: 20,),
                        text: "New Game...",
                        textStyle: _subTitleStyle(Get.isDarkMode?primaryClr:secColor),
                        onSubmit: () {
                          setState(() {
                            totalScore=0;
                            scoreList.clear();
                            Get.to(const MyHomePage());
                          });
                        },
                      )
        ],
      ),
    );
  }

  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return  OutlineInputBorder( //Outline border type for TextFeild
      borderRadius:const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
          color:!Get.isDarkMode?primaryClr:secColor,
          width: 1,
        )
    );
  }
  OutlineInputBorder myfocusborder(){
    return  OutlineInputBorder(
      borderRadius:const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
          color:!Get.isDarkMode?primaryClr:secColor,
          width: 1,
        )
    );
  }
  _buttonField(title,int count ,int state) {
    return SizedBox(
              width: MediaQuery.of(context).size.width*0.25,
              height:MediaQuery.of(context).size.height*0.07,
              child: ElevatedButton.icon(
                          onPressed: (){
                            setState(() {
                                  if(gettingText.text.isNotEmpty)
                                  {
                                    scorePoint.add(gettingText.text);
                                    counter++;
                                    if(state==1){
                                      count*=int.parse(gettingText.text);
                                      totalScore +=count*(-1);
                                      scoreList.add(totalScore.toString());
                                      gameName.add("D");
                                      gettingText.clear();
                                    } else if(state==2){
                                      count*=int.parse(gettingText.text);
                                      totalScore +=count*(-1);
                                      scoreList.add(totalScore.toString());
                                      gameName.add("K");
                                      gettingText.clear();
                                    }else if(state==3){
                                      count*=int.parse(gettingText.text);
                                      totalScore +=count*(-1);
                                      scoreList.add(totalScore.toString());
                                      gameName.add("B");
                                      gettingText.clear();
                                    }else if(state==4){
                                      count*=int.parse(gettingText.text);
                                      totalScore +=count*(-1);
                                      scoreList.add(totalScore.toString());
                                      gameName.add("L");
                                      gettingText.clear();
                                    }else if(state==5){
                                      totalScore+=int.parse(gettingText.text);
                                      scoreList.add(totalScore.toString());
                                      gameName.add("T");
                                      gettingText.clear();
                                    }                                
                                  }else if(gettingText.text.isEmpty){
                                    Get.snackbar("Ops", "Type Your Score..",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:!Get.isDarkMode?primaryClr:secColor,
                                    colorText: Get.isDarkMode?primaryClr:secColor,
                                    icon: Icon(Icons.heart_broken_outlined,color:Get.isDarkMode?primaryClr:secColor,));
                                  }
                                  if(state==0){
                                      gettingText.clear();
                                  }
                                  });
                                    }, 
                          icon:const Text(""),
                          label: Text(title,style: _titleStyle(!Get.isDarkMode?primaryClr:secColor)),
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            shape:  RoundedRectangleBorder(
                                borderRadius:  BorderRadius.circular(15),
                                ),
                            primary: Get.isDarkMode?primaryClr:secColor,
                            shadowColor: !Get.isDarkMode?primaryClr:secColor,
                            
                          ),),
    );
  }
  _titleStyle(Color col){
    return GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          //color: !Get.isDarkMode?Colors.black:Colors.white
                          color:col)
                        );
  }
  _subTitleStyle(Color col){
    return GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: col)
                        );  }
  _titleContainer(Color shadowColor,Color backColor,Color strColor,String title,String subTitle){
    return Container(
              padding: const EdgeInsets.symmetric(horizontal:10,vertical: 15),
              width: MediaQuery.of(context).size.width*0.4,
              height: MediaQuery.of(context).size.height*0.15,
              decoration: BoxDecoration(
                color:backColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: shadowColor,
                    offset:const Offset(0,0)
                        )
                      ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,  style: _titleStyle(strColor)),
                      const SizedBox(height: 10,),
                      Text(subTitle ,style:_subTitleStyle(strColor))
                               ], ),
                );
  }
}

