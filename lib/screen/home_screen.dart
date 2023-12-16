import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:pinterest_app/model/image_response.dart';
import 'package:pinterest_app/service/repository.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _repo = Repository();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: "All",)
              ],
            ),
          ),
        ),
        body: FutureBuilder(
          future: _repo.getImageList(),
          builder: (context, snapshot) {
            if(snapshot.data != null && snapshot.data?.isNotEmpty == true) {
              return MasonryGridView.builder(
                gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return _buildItem(snapshot.data?[index]);
                },
              );
            } else if(snapshot.connectionState == ConnectionState.done && snapshot.data?.isEmpty == true){
              return const Center(child: Icon(CupertinoIcons.alarm_fill));
            } else {
              return const Center(child: SpinKitFadingCircle(color: Colors.black),);
            }
          },
        )
      ),
    );
  }
  Widget _buildItem(ImageResponse? response) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(response?.urls?.regular ?? "", fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },),
          ),
          const Gap(10),
          Text(response?.user?.name ?? "")
        ],
      ),
    );
  }
}
