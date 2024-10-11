import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// AppBar
class AppBarDemo extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFAFAFA),
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: SvgPicture.asset(
          'assets/icons/camera.svg',
          width: 24,
          fit: BoxFit.fitWidth,
        ),
      ),
      leadingWidth: 36,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 6),
        child: SvgPicture.asset(
          'assets/images/instagram_logo.svg',
          width: 105,
          fit: BoxFit.fitWidth,
        ),
      ),
      actions: [
        SvgPicture.asset(
          'assets/icons/igtv.svg',
          width: 24,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          width: 18,
        ),
        SvgPicture.asset(
          'assets/icons/messenger.svg',
          width: 23,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Story
class Story extends StatelessWidget {
  const Story({super.key, required this.story});

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: story.live
                  ? [
                      const Color(0xFFE20337),
                      const Color(0xFFC60188),
                      const Color(0xFF7700C3),
                    ]
                  : [
                      const Color(0xFFFBC147),
                      const Color(0xFFD91A46),
                      const Color(0xFFA60F93),
                    ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Center(
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.asset(
                  story.avatar,
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ),
        ),
        if (story.live)
          Positioned(
            bottom: 0,
            left: 25,
            child: Container(
              width: 28,
              height: 18,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFC90083),
                    Color(0xFFD22463),
                    Color(0xFFE10038),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
              child: const Center(
                child: Text(
                  'LIVE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class StoryModel {
  final int id;
  final String avatar, name;
  final bool live;

  StoryModel(this.id, this.name, this.avatar, this.live);
}

class ListStory extends StatelessWidget {
  ListStory({super.key});

  final List<StoryModel> list = [
    StoryModel(0, 'Your Story', 'assets/images/avatar.png', false),
    StoryModel(1, 'karennne', 'assets/images/avatar1.png', true),
    StoryModel(2, 'zackjohn', 'assets/images/avatar2.png', false),
    StoryModel(3, 'kieron_d', 'assets/images/avatar3.png', false),
    StoryModel(4, 'craig_', 'assets/images/avatar4.png', false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Column(
            children: [
              Story(story: list[index]),
              const SizedBox(
                height: 3,
              ),
              Text(
                list[index].name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
