import 'package:flutter/material.dart';
import 'package:pinterest_app/model/user_response.dart';
import 'package:pinterest_app/service/repository.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _repo = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: FutureBuilder(
        future: _repo.getUser('samandarcoderdev'),
        builder: (context, snapshot) {
          if(snapshot.data != null) {
            return _successField(snapshot.data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  Widget _successField(UserResponse? user) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(user?.profileImage?.large ?? ""),
            radius:60,
          ),
          const SizedBox(height: 20),
          Text(user?.name ?? "", style: TextStyle(fontSize: 25,color: Colors.black)),
          const SizedBox(height: 10),
          Text(user?.followingCount?.toString() ?? "")
        ],
      ),
    );
  }
}
