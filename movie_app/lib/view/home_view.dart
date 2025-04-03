import 'package:flutter/material.dart';
import 'package:movie_app/model/home_model.dart';
import 'package:movie_app/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required String token});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();
  List<HomeModel> movies = [];

  @override
  void initState() {
    super.initState();
    _homeViewModel.fetchMovie().then((value) {
      if (value != null) {
        setState(() {
          movies = value;
        });
      } else {
        print("Error: No data found");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(title: Text("Home Page"));
  }

  _buildBody() {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(movies[index].title!),
          subtitle: Text(movies[index].year!.toString()),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(movies[index].poster!),
          ),
        );
      },
    );
  }
}
