import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              colors: story.isLive
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
        if (story.isLive)
          Positioned(
            bottom: 0,
            left: 26,
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

// List Story
class ListStory extends StatelessWidget {
  const ListStory({super.key, required this.list});

  final List<StoryModel> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
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
      ),
    );
  }
}

// Post Header
class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              post.avatar,
              width: 32,
              height: 32,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    post.name,
                    style: const TextStyle(
                      color: Color(0xFF262626),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  if (post.isOfficial)
                    SvgPicture.asset('assets/icons/official.svg')
                ],
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                post.address,
                style: const TextStyle(color: Color(0xFF262626), fontSize: 11),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/icons/more.svg',
            width: 14,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}

// Post Footer
class PostFooter extends StatelessWidget {
  const PostFooter({super.key, required this.post, required this.indexImage});

  final PostModel post;

  final int indexImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          builAction(),
          const SizedBox(
            height: 7,
          ),
          buildReaction(),
          const SizedBox(
            height: 4,
          ),
          builDescription(),
        ],
      ),
    );
  }

  Widget builAction() {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/like.svg',
          width: 24,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          width: 24,
        ),
        SvgPicture.asset(
          'assets/icons/comment.svg',
          width: 22,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          width: 24,
        ),
        SvgPicture.asset(
          'assets/icons/messenger.svg',
          width: 23,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          width: 70,
        ),
        if (post.images.length > 1) buildImageCarause(),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/icons/save.svg',
              width: 21,
              fit: BoxFit.fitWidth,
            ),
          ],
        )),
      ],
    );
  }

  Widget buildImageCarause() {
    return SizedBox(
      height: 6,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: post.images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 2,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: indexImage == index
                  ? const Color(0xFF3897F0)
                  : const Color(0xFF000000).withOpacity(0.15),
            ),
            width: 6,
            height: 6,
          );
        },
      ),
    );
  }

  Widget buildReaction() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            post.like.avatar,
            width: 17,
            height: 17,
          ),
        ),
        const SizedBox(width: 6.5),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF262626),
            ),
            children: [
              const TextSpan(text: 'Liked by '),
              TextSpan(
                text: post.like.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: '${post.totalLike} others',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget builDescription() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFF262626),
        ),
        children: [
          TextSpan(
            text: post.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: post.comment,
          ),
        ],
      ),
    );
  }
}

// Item Post
class PostItem extends StatefulWidget {
  const PostItem({super.key, required this.post});

  final PostModel post;

  @override
  State<StatefulWidget> createState() => PostItemState();
}

class PostItemState extends State<PostItem> with TickerProviderStateMixin {
  late PageController pageController;
  late TabController tabController;
  int curenPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    tabController = TabController(
      length: widget.post.images.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    tabController.dispose();
  }

  void handelPageViewChanged(int index) {
    tabController.index = index;
    setState(() {
      curenPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      width: screenWidth,
      child: Column(
        children: [
          PostHeader(post: widget.post),
          SizedBox(
            width: screenWidth,
            height: screenWidth,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.post.images[index],
                  fit: BoxFit.fitWidth,
                );
              },
              itemCount: widget.post.images.length,
              controller: pageController,
              onPageChanged: handelPageViewChanged,
            ),
          ),
          PostFooter(post: widget.post, indexImage: curenPageIndex),
        ],
      ),
    );
  }
}

// List Post
class PostListView extends StatelessWidget {
  const PostListView({super.key, required this.list});

  final List<PostModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return PostItem(
          post: list[index],
        );
      },
    );
  }
}

// Model
class StoryModel {
  const StoryModel({
    required this.name,
    required this.avatar,
    this.isLive = false,
  });
  final String name;

  final String avatar;

  final bool isLive;
}

class PostModel {
  const PostModel({
    required this.name,
    required this.avatar,
    required this.address,
    required this.totalLike,
    required this.like,
    required this.comment,
    required this.images,
    this.isOfficial = false,
  });

  final String name;

  final String avatar;

  final String address;

  final String comment;

  final int totalLike;

  final List<String> images;

  final Like like;

  final bool isOfficial;
}

class Like {
  const Like({
    required this.name,
    required this.avatar,
  });

  final String name;

  final String avatar;
}

class Comment {
  const Comment({
    required this.name,
    required this.content,
  });

  final String name;

  final String content;
}

// Home page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<StoryModel> listStory = [
    const StoryModel(name: 'Your Story', avatar: 'assets/images/avatar.png'),
    const StoryModel(
      name: 'karennne',
      avatar: 'assets/images/avatar1.png',
      isLive: true,
    ),
    const StoryModel(name: 'zackjohn', avatar: 'assets/images/avatar2.png'),
    const StoryModel(name: 'kieron_d', avatar: 'assets/images/avatar3.png'),
    const StoryModel(name: 'craig_love', avatar: 'assets/images/avatar4.png'),
    const StoryModel(name: 'karennne', avatar: 'assets/images/avatar1.png'),
    const StoryModel(name: 'zackjohn', avatar: 'assets/images/avatar2.png'),
    const StoryModel(name: 'kieron_d', avatar: 'assets/images/avatar3.png'),
    const StoryModel(name: 'craig_love', avatar: 'assets/images/avatar4.png'),
  ];

  final List<PostModel> listPosts = [
    const PostModel(
      name: 'joshua_l',
      avatar: 'assets/images/avatar1.png',
      address: 'Tokyo, Japan',
      images: [
        'assets/images/post.png',
        'assets/images/post1.png',
        'assets/images/post2.png',
        'assets/images/post3.png',
      ],
      comment: 'The game in Japan was amazing and I want to share some photos',
      totalLike: 44686,
      like: Like(
        name: 'craig_love',
        avatar: 'assets/images/avatar4.png',
      ),
      isOfficial: true,
    ),
    const PostModel(
      name: 'joshua_l',
      avatar: 'assets/images/avatar2.png',
      images: ['assets/images/post.png'],
      address: 'Tokyo, Japan',
      comment: 'The game in Japan was amazing and I want to share some photos',
      totalLike: 44686,
      like: Like(
        name: 'craig_love',
        avatar: 'assets/images/avatar4.png',
      ),
    ),
    const PostModel(
      name: 'joshua_l',
      avatar: 'assets/images/avatar3.png',
      images: ['assets/images/post.png'],
      address: 'Tokyo, Japan',
      comment: 'The game in Japan was amazing and I want to share some photos',
      totalLike: 44686,
      like: Like(
        name: 'craig_love',
        avatar: 'assets/images/avatar4.png',
      ),
    ),
    const PostModel(
      name: 'joshua_l',
      avatar: 'assets/images/avatar4.png',
      images: ['assets/images/post.png'],
      address: 'Tokyo, Japan',
      comment: 'The game in Japan was amazing and I want to share some photos',
      totalLike: 44686,
      like: Like(
        name: 'craig_love',
        avatar: 'assets/images/avatar4.png',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDemo(),
      body: SafeArea(
        child: Column(
          children: [
            ListStory(list: listStory),
            Expanded(
              child: PostListView(list: listPosts),
            )
          ],
        ),
      ),
    );
  }
}

// Main Page
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  var selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0x1A000000),
              width: 0.5,
            ),
          ),
        ),
        child: buildBttomNavigationBar(),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      toolbarHeight: 0,
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  Widget buildBody() {
    switch (selectedTabIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const Center(
          child: Text('Page Search'),
        );
      case 2:
        return const Center(
          child: Text('Page Image'),
        );
      case 3:
        return const Center(
          child: Text('Page Favorite'),
        );
      case 4:
        return const Center(
          child: Text('Page Profile'),
        );
      default:
        return const SizedBox();
    }
  }

  Widget buildBttomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.shifting,
      currentIndex: selectedTabIndex,
      backgroundColor: const Color(0xFFFAFAFA),
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SvgPicture.asset(
              selectedTabIndex == 0
                  ? 'assets/icons/selected_home_tab.svg'
                  : 'assets/icons/home_tab.svg',
              width: 24,
              fit: BoxFit.fitWidth,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SvgPicture.asset(
              selectedTabIndex == 1
                  ? 'assets/icons/selected_search_tab.svg'
                  : 'assets/icons/search_tab.svg',
              width: 24,
              fit: BoxFit.fitWidth,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SvgPicture.asset(
              'assets/icons/new_tab.svg',
              width: 24,
              fit: BoxFit.fitWidth,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SvgPicture.asset(
              selectedTabIndex == 3
                  ? 'assets/icons/selected_favorite_tab.svg'
                  : 'assets/icons/favorite_tab.svg',
              width: 24,
              fit: BoxFit.fitWidth,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: selectedTabIndex == 4
                        ? Colors.black
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(3),
                child: Center(
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 40,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            label: ''),
      ],
      onTap: (index) {
        setState(() {
          selectedTabIndex = index;
        });
      },
    );
  }
}
