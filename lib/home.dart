import 'package:danhnhan/color.dart';
import 'package:danhnhan/people.dart';
import 'package:danhnhan/people_detail.dart';
import 'package:danhnhan/people_presenter.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeTab extends StatefulWidget {
  // String? search;
  const HomeTab({
    Key? key,
  }) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final searchController = TextEditingController();
  bool isCheck = false;
  @override
  void initState() {
    searchController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<People> people = PeoplePresent().getPostList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leadingWidth: 0,
        title: !isCheck
            ? const Text(
                'Danh nhân văn hóa Việt Nam',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            : TextFormField(
                textAlign: TextAlign.left,
                enableSuggestions: true,
                controller: searchController,
                onFieldSubmitted: (text) {},
                onChanged: (value) async {
                  setState(() {
                    searchController
                      ..text = value
                      ..selection = TextSelection.collapsed(
                          offset: searchController.text.length);
                    // people = PeoplePresent().search(searchController.text);
                    // print(searchController.text);
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(top: 5),
                  hintText: "Tìm kiếm tên danh nhân",
                  hintStyle: TextStyle(color: Colors.black),
                  prefix: SizedBox(
                    width: size.width * 0.05,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => MyApp()));
                        setState(() {
                          searchController..text = '';
                          // isCheck = false;
                        });
                      },
                      color: Colors.black,
                      icon: Icon(Icons.close)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: white_blue),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (isCheck) {
                    isCheck = false;
                  } else {
                    isCheck = true;
                  }
                });
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
        },
        child: Builder(builder: (context) {
          people = PeoplePresent().search(searchController.text);
          if (people.isNotEmpty) {
            return ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PeopleDetail(
                                people: people[index],
                              )));
                    },
                    child: Container(
                      height: size.height * 0.105,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45)),
                      child: Row(children: [
                        Container(
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(5),
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: Colors.grey,
                            //       spreadRadius: 3,
                            //       blurRadius: 3,
                            //       offset: Offset(0, 1)),
                            // ],
                          ),
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                people[index].image.toString(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // GradientText(
                                //   people[index].name.toString(),
                                //   style: const TextStyle(
                                //     fontSize: 18,
                                //   ),
                                //   colors: const [
                                //     Color(0xffA1A1A1),
                                //     Color(0xff201796),
                                //     Color(0xff3D3D3D),
                                //   ],
                                // ),
                                Text(
                                  people[index].name.toString(),
                                  style: const TextStyle(
                                      color: black_text,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  people[index].decription.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                )
                              ],
                            )),
                        // Expanded(
                        //     flex: 1,
                        //     child: IconButton(
                        //         onPressed: () {
                        //           setState(() {
                        //             Icon(
                        //               Icons.bookmark,
                        //               color: Colors.yellow,
                        //             );
                        //           });
                        //         },
                        //         icon: const Icon(
                        //           Icons.bookmark,
                        //           color: Colors.grey,
                        //           size: 30,
                        //         ))),
                      ]),
                    ),
                  );
                });
          } else {
            return Center(
              child: Text(
                'Không tìm thấy danh nhân.',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            );
          }
        }),
      ),
    );
  }
}
