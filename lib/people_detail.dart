import 'package:danhnhan/main.dart';
import 'package:danhnhan/people.dart';
import 'package:flutter/material.dart';

class PeopleDetail extends StatefulWidget {
  final People people;
  const PeopleDetail({Key? key, required this.people}) : super(key: key);

  @override
  _PeopleDetailState createState() => _PeopleDetailState();
}

class _PeopleDetailState extends State<PeopleDetail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MyApp()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text(
          'Thông tin chi tiết',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              height: size.height * 0.3,
              child: Image(
                image: AssetImage(widget.people.image.toString()),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Center(
              child: Text(
                widget.people.name.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            RichText(
              text: TextSpan(
                text: 'Năm sinh: ',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
                children: [
                  TextSpan(
                      text: widget.people.dateB.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                  const TextSpan(
                      text: ' - ',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal)),
                  TextSpan(
                      text: widget.people.dateD.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            RichText(
              text: TextSpan(
                text: 'Quê quán: ',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
                children: [
                  TextSpan(
                      text: widget.people.born.toString() + '.',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            RichText(
              text: TextSpan(
                text: 'Mô tả: ',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
                children: [
                  TextSpan(
                      text: widget.people.decription.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            RichText(
              text: TextSpan(
                text: 'Nguồn: ',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
                children: [
                  TextSpan(
                      text: 'nguoikesu.com',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
