import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          snap: false,
          floating: false,
          leading: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          actions: const [
            Icon(
              Icons.search,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.more_vert,
              size: 30,
            )
          ],
          expandedHeight: 180.0,
          flexibleSpace: LayoutBuilder(builder: (context, constraints) {
            bool isAppBarExpanded = constraints.maxHeight >
                kToolbarHeight + MediaQuery.of(context).padding.top;
            return FlexibleSpaceBar(
                title: isAppBarExpanded
                    ? const SizedBox()
                    : const Text('Coding is Love'),
                background: Image.asset('images/cover.png', fit: BoxFit.cover));
          }),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: index.isOdd ? Colors.white : Colors.black12,
                height: 100.0,
                child: Center(
                  child: Text('Tweet ${index + 1}'),
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    ));
  }
}
