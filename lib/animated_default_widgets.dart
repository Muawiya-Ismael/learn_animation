import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Default Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Widget> pages = [
    const AnimatedContainerPage(),
    const AnimatedOpacityPage(),
    const AnimatedAlignPage(),
    const AnimatedCrossFadePage(),
    const AnimatedPositionedPage(),
    const AnimatedSwitcherPage(),
    const AnimatedPaddingPage(),
    const AnimatedPhysicalModelPage(),
    const AnimatedPositionedDirectionalPage(),
    const AnimatedThemePage(),
    const AnimatedDefaultTextStylePage(),
    const AnimatedListPage(),
    AnimatedModalBarrierPage(),
    const AnimatedIconPage(),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Default Widgets')),
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  _AnimatedContainerPageState createState() {
    return _AnimatedContainerPageState();
  }
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _size = _size == 100.0 ? 200.0 : 100.0;
            });
          },
          child: AnimatedContainer(
            duration:const Duration(seconds: 1),
            width: _size,
            height: _size,
            color: Colors.blue,
            curve: Curves.easeInOut,
            child:const Center(
              child: Text(
                'Tap Me!',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({super.key});

  @override
  _AnimatedOpacityPageState createState() {
    return _AnimatedOpacityPageState();
  }
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _opacity = _opacity == 1.0 ? 0.0 : 1.0;
            });
          },
          child: AnimatedOpacity(
            duration:const  Duration(seconds: 1),
            opacity: _opacity,
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.red,
              child:const Center(
                child: Text(
                  'Tap Me!',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedAlignPage extends StatefulWidget {
  const AnimatedAlignPage({super.key});

  @override
  _AnimatedAlignPageState createState() {
    return _AnimatedAlignPageState();
  }
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  bool _alignedTop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _alignedTop = !_alignedTop;
            });
          },
          child: Container(
            width: 300.0,
            height: 300.0,
            color: Colors.green,
            child: AnimatedAlign(
              duration:const Duration(seconds: 1),
              alignment: _alignedTop ? Alignment.topCenter : Alignment.bottomCenter,
              curve: Curves.easeInOut,
              child: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.yellow,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedCrossFadePage extends StatefulWidget {
  const AnimatedCrossFadePage({super.key});

  @override
  _AnimatedCrossFadePageState createState() {
    return _AnimatedCrossFadePageState();
  }
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _showFirst = !_showFirst;
            });
          },
          child: AnimatedCrossFade(
            duration:const Duration(seconds: 1),
            firstChild: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.orange,
              child:const Center(
                child: Text(
                  'First',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            secondChild: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.purple,
              child:const Center(
                child: Text(
                  'Second',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            crossFadeState: _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}

class AnimatedPositionedPage extends StatefulWidget {
  const AnimatedPositionedPage({super.key});

  @override
  _AnimatedPositionedPageState createState() {
    return _AnimatedPositionedPageState();
  }
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  bool _topLeft = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _topLeft = !_topLeft;
          });
        },
        child: Stack(
          children: [
            AnimatedPositioned(
              duration:const Duration(seconds: 1),
              left: _topLeft ? 0 : 200,
              top: _topLeft ? 0 : 400,
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedSwitcherPage extends StatefulWidget {
  const AnimatedSwitcherPage({super.key});

  @override
  _AnimatedSwitcherPageState createState() {
    return _AnimatedSwitcherPageState();
  }
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _count += 1;
            });
          },
          child: AnimatedSwitcher(
            duration:const Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Container(
              key: ValueKey<int>(_count),
              width: 200.0,
              height: 200.0,
              color: Colors.cyan,
              child: Center(
                child: Text(
                  '$_count',
                  style:const TextStyle(color: Colors.white, fontSize: 48),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class AnimatedPaddingPage extends StatefulWidget {
  const AnimatedPaddingPage({super.key});

  @override
  _AnimatedPaddingPageState createState() => _AnimatedPaddingPageState();
}

class _AnimatedPaddingPageState extends State<AnimatedPaddingPage> {
  double _padding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if(_padding == 50){
                _padding = 10;
              }else{
                _padding = 50;
              }
            });
          },
          child: Center(
            child: AnimatedPadding(
              padding: EdgeInsets.all(_padding),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Container(
                color: Colors.blue,
                child: const Text(
                  'Animated Padding',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedPhysicalModelPage extends StatefulWidget {
  const AnimatedPhysicalModelPage({super.key});

  @override
  _AnimatedPhysicalModelPageState createState() =>
      _AnimatedPhysicalModelPageState();
}

class _AnimatedPhysicalModelPageState
    extends State<AnimatedPhysicalModelPage> {
  double _elevation = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _elevation = _elevation == 2.0 ? 10.0 : 2.0;
            });
          },
          child: AnimatedPhysicalModel(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            shape: BoxShape.rectangle,
            elevation: _elevation,
            color: Colors.blue,
            shadowColor: Colors.black
            ,
            child: const SizedBox(
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedPositionedDirectionalPage extends StatefulWidget {
  const AnimatedPositionedDirectionalPage({super.key});

  @override
  _AnimatedPositionedDirectionalPageState createState() =>
      _AnimatedPositionedDirectionalPageState();
}

class _AnimatedPositionedDirectionalPageState
    extends State<AnimatedPositionedDirectionalPage> {
  bool _startPosition = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _startPosition = !_startPosition;
          });
        },
        child: Stack(
          children: [
            AnimatedPositionedDirectional(
              duration: const Duration(seconds: 1),
              start: _startPosition ? 0 : 200,
              top: 50.0,
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedThemePage extends StatefulWidget {
  const AnimatedThemePage({super.key});

  @override
  _AnimatedThemePageState createState() => _AnimatedThemePageState();
}

class _AnimatedThemePageState extends State<AnimatedThemePage> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isDarkTheme = !_isDarkTheme;
            });
          },
          child: AnimatedTheme(
            data: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
            duration: const Duration(seconds: 1),
            child: Scaffold(
              appBar: AppBar(title: const Text('Animated Theme')),
              body: const Center(child: Text('Switch Theme')),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedDefaultTextStylePage extends StatefulWidget {
  const AnimatedDefaultTextStylePage({super.key});

  @override
  _AnimatedDefaultTextStylePageState createState() =>
      _AnimatedDefaultTextStylePageState();
}

class _AnimatedDefaultTextStylePageState
    extends State<AnimatedDefaultTextStylePage> {
  bool _isLargeFont = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isLargeFont = !_isLargeFont;
            });
          },
          child: AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 1),
            style: TextStyle(
              fontSize: _isLargeFont ? 40.0 : 20.0,
              color: Colors.blue,
            ),
            child: const Text('Animated Text Style'),
          ),
        ),
      ),
    );
  }
}

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({super.key});

  @override
  _AnimatedListPageState createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _insertItem();
              },
              child: const Text('Add Item'),
            ),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _items.length,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: animation.drive(Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: const Offset(0, 0),
                    )),
                    child: ListTile(
                      title: Text(_items[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _insertItem() {
    final int index = _items.length;
    _items.add('Item ${index + 1}');
    _listKey.currentState?.insertItem(index);
  }
}


class AnimatedModalBarrierPage extends StatefulWidget {
  @override
  _AnimatedModalBarrierPageState createState() =>
      _AnimatedModalBarrierPageState();
}

class _AnimatedModalBarrierPageState extends State<AnimatedModalBarrierPage>
with SingleTickerProviderStateMixin {
bool _isBarrierVisible = false;
late AnimationController _controller;
late Animation<Color?> _colorAnimation;

@override
void initState() {
  super.initState();
  _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );
  _colorAnimation = ColorTween(
    begin: Colors.transparent,
    end: Colors.black.withOpacity(0.5),).animate(_controller);
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isBarrierVisible = !_isBarrierVisible;
                if (_isBarrierVisible) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              });
            },
            child: const Text('Toggle Barrier'),
          ),
        ),
        AnimatedModalBarrier(
          color: _colorAnimation, // Use the color animation
          dismissible: true,
        ),
      ],
    ),
  );
}
}

class AnimatedIconPage extends StatefulWidget {
  const AnimatedIconPage({super.key});

  @override
  _AnimatedIconPageState createState() => _AnimatedIconPageState();
}

class _AnimatedIconPageState extends State<AnimatedIconPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          iconSize: 100.0,
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
          ),
          onPressed: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
        ),
      ),
    );
  }
}