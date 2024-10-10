import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Less Widget
class LessWidget extends StatelessWidget {
  const LessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Less Widget'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: LessButton(isFavorite: true),
      ),
    );
  }
}

class LessButton extends StatelessWidget {
  const LessButton({super.key, required this.isFavorite});

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        debugPrint('Xin Chào');
      },
      icon: isFavorite
          ? const Icon(
              Icons.favorite,
              color: Colors.pinkAccent,
            )
          : const Icon(Icons.favorite_border),
    );
  }
}

// Full Widget
class FullWidget extends StatelessWidget {
  const FullWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Widget'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(child: FullButton(isFavorite: true)),
    );
  }
}

class FullButton extends StatefulWidget {
  const FullButton({super.key, required this.isFavorite});

  final bool isFavorite;

  @override
  State<StatefulWidget> createState() => StateFullButton();
}

class StateFullButton extends State<FullButton> {
  var isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(
          () {
            isFavorite = !isFavorite;
          },
        );
      },
      icon: isFavorite
          ? const Icon(Icons.favorite, color: Colors.pinkAccent)
          : const Icon(Icons.favorite_border),
    );
  }
}

// Build Context
class BuildContextDemo extends StatelessWidget {
  const BuildContextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Build Context'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Builder(
        builder: (context) {
          return TextButton(
            onPressed: () {
              Scaffold.of(context).showBottomSheet(
                (context) {
                  return const BottomSheetPage();
                },
              );
            },
            child: const Text('BUTTON'),
          );
        },
      ),
    );
  }
}

class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('BottomSheet'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close BottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}

// MaterialApp
class MaterialAppDemo1 extends StatelessWidget {
  const MaterialAppDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MaterialAppDemo2 extends StatelessWidget {
  const MaterialAppDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/home': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home router'),
            ),
          );
        },
        '/login': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Login router'),
            ),
          );
        }
      },
    );
  }
}

class MaterialAppDemo3 extends StatelessWidget {
  const MaterialAppDemo3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MaterialApp Theme'),
        ),
      ),
    );
  }
}

// Scaffold
class ScaffolDemo extends StatelessWidget {
  const ScaffolDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold'),
      ),
      body: const Center(
        child: Text('Hello wold'),
      ),
      backgroundColor: Colors.blueGrey.shade200,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.favorite,
          color: Colors.pinkAccent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
}

// SafeArea
class SafeAreaDemo extends StatelessWidget {
  const SafeAreaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafeArea'),
      ),
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.blueGrey.shade200,
          child: const Center(
            child: Text(
              'This is the content of the app',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: const Color(0x1A000000),
          height: 1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Google and Edge and Cococ',
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
            RichTextDemo2(),
          ],
        ),
      ),
    );
  }
}

// RichText
class RichTextDemo1 extends StatelessWidget {
  const RichTextDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: 'G',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 60,
          color: Colors.blue,
        ),
        children: [
          TextSpan(
            text: 'o',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: Colors.red,
            ),
          ),
          TextSpan(
            text: 'o',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: Colors.yellow,
            ),
          ),
          TextSpan(
            text: 'g',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: Colors.blue,
            ),
          ),
          TextSpan(
            text: 'l',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: Colors.green,
            ),
          ),
          TextSpan(
            text: 'e',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class RichTextDemo2 extends StatelessWidget {
  const RichTextDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'G',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'o',
            style: TextStyle(
              color: Colors.red,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'o',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'g',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'l',
            style: TextStyle(
              color: Colors.green,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'e',
            style: TextStyle(
              color: Colors.red,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDemo(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/profile.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Image.network(
                'https://ongchaulaptrinh.github.io/images/profile.png'),
          ],
        ),
      ),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFFFBC147),
            Color(0xFFD91A46),
            Color(0xFFA60F93),
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
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 4,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Image.asset(
              'assets/images/avatar.png',
              width: 70,
              height: 70,
            ),
          ),
        ),
      ),
    );
  }
}

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarDemo(),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                ColumDemo(),
                SizedBox(
                  width: 12,
                ),
                ColumDemo(),
                SizedBox(
                  width: 12,
                ),
                ColumDemo(),
                SizedBox(
                  width: 12,
                ),
                ColumDemo(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class ColumDemo extends StatelessWidget {
  const ColumDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ContainerDemo(),
        SizedBox(
          height: 8,
        ),
        Text('Your Story'),
      ],
    );
  }
}
