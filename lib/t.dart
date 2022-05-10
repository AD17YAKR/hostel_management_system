/* // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_mangement_system/utils/colors.dart';
import 'package:intl/intl.dart';

class TranscationPage extends StatefulWidget {
  const TranscationPage({Key? key}) : super(key: key);

  @override
  State<TranscationPage> createState() => _TranscationPageState();
}

class _TranscationPageState extends State<TranscationPage> {
  String dropdownValue = "By Month";
  int filterSelectedIndex = 1;
  DateTime selectDate = DateTime.now();
  int page = 1;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  DateTime dt = DateTime.now();
  bool isLoading = true;
  DateTimeRange rangeDate =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  bool hasMore = true;

  getDateRange() async {
    DateTimeRange? newDate = await showDateRangePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime.now().add(
        Duration(days: 10),
      ),
    );
    if (newDate == null) {
      return;
    } else {
      // print(rangeDate);
      setState(() {
        // selectDate = newDate;
        isLoading = true;
        rangeDate = newDate;
        hasMore = true;
        page = 1;
        // orderHistory = [];
        print(DateFormat('yyyy-MM-dd').format(rangeDate.start));
        print(DateFormat('yyyy-MM-dd').format(rangeDate.end));
        setState(() {
          hasMore = true;
        });
        startDate = rangeDate.start;
        endDate = rangeDate.end;
      });
    }
  }

  getDate() async {
    DateTime? newDate = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2022),
      lastDate: DateTime.now().add(
        Duration(days: 10),
      ),
    );
    if (newDate == null) return;
    setState(() {
      print(newDate);
      isLoading = true;
      hasMore = true;
      page = 1;
      // orderHistory = [];
      selectDate = newDate;
      // selectedDate = newDate.toString();
      startDate = newDate;
      endDate = newDate;
      // _loadMoreVertical(newDate, endDate);
      // filterData(newDate, newDate);
    });
  }
/*  */
  getMonth() async {
    // print("In getMonth");
    DateTime? newDate = await showMonthPicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2022),
      lastDate: ntpTime.add(
        Duration(days: 10),
      ),
    );
    if (newDate == null) return;
    setState(() {
      print("-------------------");
      print(newDate);
      print("-------------------");
      isLoading = true;
      hasMore = true;
      startDate = newDate;
      // endDate = getMonthsLastDate(newDate);
      page = 1;
      // orderHistory = [];
      selectDate = newDate;
      // selectedDate = newDate.toString();
      // _loadMoreVertical(newDate, getMonthsLastDate(newDate));
      // filterData(newDate, getMonthsLastDate(newDate));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 28,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
          ),
          backgroundColor: primaryColor,
          title: Text(
            "Transactions",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w500, letterSpacing: .3),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Get.to(Notifications());
              },
              icon: Icon(
                Icons.notifications_none,
                size: 28,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // rupeerefined(20 , 30 , primaryColor),
                            Text(
                              " 1290",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 37,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Wallet Balance",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Transaction History",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 4,
                      maximumSize: Size(125, 36),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 15,
                      ),
                      iconEnabledColor: primaryColor,
                      elevation: 16,
                      underline: Container(
                        height: 2,
                      ),
                      onChanged: (String? newValue) async {
                        if (newValue == "Custom") {
                          setState(() {
                            filterSelectedIndex = 3;
                          });
                          getDateRange();
                        }
                        if (newValue == "By Month") {
                          setState(() {
                            filterSelectedIndex = 2;
                          });
                          getMonth();
                        }
                        if (newValue == "By Date") {
                          setState(() {
                            filterSelectedIndex = 1;
                          });
                          getDate();
                        }
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        "Filters",
                        "By Date",
                        "By Month",
                        "Custom"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  /*   ElevatedButton(
                    onPressed: () {
                      CheckboxListTile(
                        title: Text("title text"),
                        value: false,
                        onChanged: (newValue) {
                          setState(() {});
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      );
                    },
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 15,
                      ),
                      iconEnabledColor: primaryColor,
                      elevation: 16,
                      underline: Container(
                        height: 2,
                      ),
                      onChanged: (String? newValue) async {
                        if (newValue == "Custom") {
                          setState(() {
                            filterSelectedIndex = 3;
                          });
                          getDateRange();
                        }
                        if (newValue == "By Month") {
                          setState(() {
                            filterSelectedIndex = 2;
                          });
                          // getMonth();
                        }
                        if (newValue == "By Date") {
                          setState(() {
                            filterSelectedIndex = 1;
                          });
                          // getDate();
                        }
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        "Filters",
                        "By Date",
                        "By Month",
                        "Custom"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 4,
                      maximumSize: Size(125, 36),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )
                 */
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TransactionCard(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      color: primaryColor,
    );
  }

  Widget TransactionCard() {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'WED',
                style: TextStyle(
                  color: Color(0xff787878),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '29\n',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: 45,
                        height: 45,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://picsum.photos/seed/944/600',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chacha Supplier',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '+500',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  DateTime.now().toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */