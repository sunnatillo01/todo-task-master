
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:todo_height/screens/calendar.dart';
import 'package:todo_height/screens/details_event_screen.dart';

import 'package:todo_height/widgets/Schedule.dart';

import '../bloc/get_all_data_model_bloc.dart';
import 'add_event_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetAllDataModelBloc>(context)
        .add(StartGetALlDataModelEvent());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 28),
                Column(
                  children: const [
                    Text(
                      'Sunday',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                     SizedBox(height: 7),
                    // Row(
                    //   children: [
                    //     const Text(
                    //       '28 September 2023',
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Image.asset(
                    //       'images/bottom.png',
                    //       height: 13,
                    //       width: 15,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(
                      'images/notification.png',
                      height: 28,
                      width: 28,
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(
                        left: 17,
                        right: 1,
                        top: 1,
                      ),
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 280,
              width: 310,
              decoration: const BoxDecoration(),
              child: Calendar(),
              // child: Column(
              //   children: [
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     dataW("1", () {}),
              //     dataW("2", () {}),
              //     dataW("3", () {}),
              //     dataW("4", () {}),
              //     dataW("5", () {}),
              //     dataW("6", () {}),
              //     dataW('7', () {})
              //   ],
              // ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     dataW("8", () {}),
              //     dataW("9", () {}),
              //     dataW("10", () {}),
              //     dataW("11", () {}),
              //     dataW("12", () {}),
              //     dataW("13", () {}),
              //     dataW('14', () {})
              //   ],
              // ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     dataW("15", () {}),
              //     dataW("16", () {}),
              //     dataW("27", () {}),
              //     dataW("28", () {}),
              //     dataW("29", () {}),
              //     dataW("20", () {}),
              //     dataW('21', () {})
              //   ],
              // ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     dataW("22", () {}),
              //     dataW("23", () {}),
              //     dataW("24", () {}),
              //     dataW("25", () {}),
              //     dataW("26", () {}),
              //     dataW("27", () {}),
              //     dataW('28', () {})
              //   ],
              // ),
              // ],
              // ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Schedule',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const AddEventScreen();
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.blue,
                    ),
                    child: const Text(
                      '+ Add Event',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            BlocBuilder<GetAllDataModelBloc, GetAllDataModelState>(
              builder: (context, state) {
                return state is GetAllDataModelSucces
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ListView.builder(
                          itemCount: state.dataModel.length,
                          itemBuilder: (context, index) {
                            return schedule(
                                context,
                                state.dataModel[index].name ?? "",
                                state.dataModel[index].description ?? "",
                                state.dataModel[index].time ?? "",
                                state.dataModel[index].lat ?? "",
                                state.dataModel[index].colorIndex ?? "b", () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return DetailsEventScreen(data: state.dataModel[index]);
                                  
                                
                              }));
                            });
                          },
                        ),
                      )
                    : const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }

  dataW(String txt, VoidCallback onPressed) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: Center(
                child: Text(
              txt,
              style: const TextStyle(color: Colors.black),
            ))));
  }

  schedule(BuildContext context, String title, String subTitle, String time,
      String location, String colorW, VoidCallback onPressed) {
    Color colorI = Colors.blue;

    if (colorW == "b") {
      colorI = Colors.blue;
    } else if (colorW == "o") {
      colorI = Colors.orange;
    } else {
      colorI = Colors.red;
    }
    print('++++++++++++++++++');
    print(colorW);
    print(colorI.toString());
    print('++++++++++++++++++');
    return InkWell(
      onTap: onPressed,
      child: Schedule(
        color1: colorI,
        color2: const Color(0xFFC6E6F6),
        title: title,
        subTitle: subTitle,
        time: time,
        location: location,
      ),
    );
  }
}
