import 'package:flutter/material.dart';

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
            : const Icon(Icons.favorite_border));
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
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: isFavorite
            ? const Icon(Icons.favorite, color: Colors.pinkAccent)
            : const Icon(Icons.favorite_border));
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
      body: Builder(builder: (context) {
        return TextButton(
            onPressed: () {
              Scaffold.of(context).showBottomSheet((context) {
                return const BottomSheetPage();
              });
            },
            child: const Text('BUTTON'));
      }),
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
                child: const Text('Close BottomSheet'))
          ],
        ),
      ),
    );
  }
}
