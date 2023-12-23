import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_app/service/repository.dart';

import '../model/image_response.dart';
import '../widget/pin_item.dart';

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({super.key, required this.query});

  final String query;

  @override
  State<ImageSearchScreen> createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {

  final _searchController = TextEditingController();
  final _repo = Repository();

  bool _isLoading = false; /// 1

  final List<Results> results = [];

  @override
  void initState() {
    if (widget.query.isNotEmpty) {
      _searchImages(widget.query);
    }
    super.initState();
  }

  void _searchImages(String query) async {
    setState(() {
      _isLoading = true; /// 2
    });
    results.clear();
    final images = await _repo.getImageList(query);
    results.addAll(images);
    _isLoading = false; /// 3
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                _searchImages(value);
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey.shade200,
                  contentPadding: EdgeInsets.all(20),
                  hintText: 'Search ideas...',
                  suffix: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("cancel"),
                  )
              ),
            ),
          ),
        ),
        body: _isLoading ? const Center(child: CircularProgressIndicator()) :
        MasonryGridView.builder(
          gridDelegate:
          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: results.length,
          itemBuilder: (context, index) {
            return PinItem(result: results[index]);
          },
        )
    );
  }
}
