import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 200,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Pencucian",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }
}

Stack _buildBody() {
  return Stack(
    children: [
      SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            _taskHeader(),
            const SizedBox(
              height: 15,
            ),
            buildGrid(),
          ]),
        ),
      )
    ],
  );
}

Row _taskHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Layanan",
        style: TextStyle(
          color: Colors.blueGrey[900],
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    ],
  );
}

StaggeredGrid buildGrid() {
  return StaggeredGrid.count(
    crossAxisCount: 2,
    mainAxisSpacing: 15,
    crossAxisSpacing: 15,
    children: const [
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.3,
        child: TaskGroupContainer(
          color: Colors.pink,
          icon: Icons.car_repair,
          // taskCount: 10,
          taskGroup: "Mobil",
        ),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: TaskGroupContainer(
          color: Colors.orange,
          // isSmall: true,
          icon: Icons.motorcycle_rounded,
          // taskCount: 5,
          taskGroup: "Sepeda Motor",
        ),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.3,
        child: TaskGroupContainer(
          color: Colors.green,
          icon: Icons.notifications_rounded,
          // taskCount: 2,
          taskGroup: "Status",
        ),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: TaskGroupContainer(
          color: Colors.blue,
          // isSmall: true,
          icon: Icons.wallet_giftcard,
          // taskCount: 9,
          taskGroup: "Karpet",
        ),
      ),
    ],
  );
}

class TaskGroupContainer extends StatelessWidget {
  final MaterialColor color;
  final bool? isSmall;
  final IconData icon;
  final String taskGroup;
  // final num taskCount;
  const TaskGroupContainer({
    Key? key,
    required this.color,
    this.isSmall = false,
    required this.icon,
    required this.taskGroup,
    // required this.taskCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color[400],
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 4,
            offset: const Offset(2, 6),
          )
        ],
        // gradient: AppColors.getDarkLinearGradient(color),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            color[400]!,
            color[300]!,
            color[200]!,
          ],
          stops: const [
            0.4,
            0.6,
            1,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: isSmall! ? Alignment.centerLeft : Alignment.center,
            child: Icon(
              icon,
              size: isSmall! ? 60 : 120,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            taskGroup,
            // maxLines: 2,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   "$taskCount Task",
          //   style: TextStyle(
          //     color: Colors.white.withOpacity(0.7),
          //     fontSize: 12,
          //   ),
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
        ],
      ),
    );
  }
}
