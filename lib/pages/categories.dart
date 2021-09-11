import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/data/incomeData.dart';
import 'package:eco_ml/data/outcomeData.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  final box = Hive.box('id');
  late TabController _tabController;
  int activeIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    _tabController.addListener(() {
      setState(() {
        activeIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Hive.close();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff4F98A1),
          title: Text('Add'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // give the ta
              //b bar a height [can change height to preferred height]
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: activeIndex == 0
                        ? BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          )
                        : BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                    color: activeIndex == 0
                        ? Color(0xffFFC0CE)
                        : Color(0xff9FEACF),
                  ),
                  isScrollable: false,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Expense',
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Income',
                    ),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // first tab bar view widget
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemCount: 21,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: Icon(
                                        activeIndex == 0
                                            ? outcomeData[index].iconName
                                            : incomeData[index].iconName,
                                            color: Colors.grey.shade600,
                                        size: 25,
                                      ),
                                    ),
                                    Text(outcomeData[index].title),
                                  ],
                                ),
                              ),
                              onTap: () {
                                navigateToTransaction(context);
                                box.put(0, index);
                                box.put(1, false);
                              });
                        },
                      ),
                    ),

                    // second tab bar view widget
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Icon(
                                      incomeData[index].iconName,
                                      size: 25,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Text(incomeData[index].title),
                                ],
                              ),
                            ),
                            onTap: (){
                              navigateToTransaction(context);
                              box.put(0, index);
                              box.put(1, true);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void navigateToTransaction(BuildContext context) {
  AutoRouter.of(context).push(TransactionRoute());
}
