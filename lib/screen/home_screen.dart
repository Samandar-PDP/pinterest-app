import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:pinterest_app/model/image_response.dart';
import 'package:pinterest_app/screen/detail_screen.dart';
import 'package:pinterest_app/service/repository.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _repo = Repository();

  final _categories = ['All', 'Football', 'Love', 'Nature', 'Food', 'Car'];

  int _selectedIndex = 0;

  /// 1
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Chip(
                          label: Text(_categories[index]),
                          backgroundColor: _selectedIndex == index ? Colors.greenAccent.shade200 : Colors.transparent,
                        )),
                  ),
                ),
              )),
        ),
        body: FutureBuilder(
          future: _repo.getImageList(_categories[_selectedIndex]),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data?.isNotEmpty == true) {
              return MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return _buildItem(snapshot.data?[index]);
                },
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data?.isEmpty == true) {
              return const Center(child: Icon(CupertinoIcons.alarm_fill));
            } else {
              return const Center(
                child: SpinKitFadingCircle(color: Colors.black),
              );
            }
          },
        ));
  }

  Widget _buildItem(Results? result) {
    final color =
        "0xFF${result?.color?.substring(1, result.color?.length)}";
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(
            result: result,
          )));
        },
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(int.parse(color))),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  result?.urls?.regular ?? "",
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
              const Gap(10),
              Text(
                result?.user?.name ?? "",
                style: const TextStyle(fontSize: 17, color: Colors.white),
              ),
              const Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}
