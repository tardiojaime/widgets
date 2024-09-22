import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca de comida', 'Excepteur amet quis anim aute in minim.',
      'assets/img/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Velit esse non exercitation irure ad enim esse velit incididunt ad irure.',
      'assets/img/2.png'),
  SlideInfo('Disfruta la comida', 'Amet dolore consectetur ut esse quis.',
      'assets/img/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController _pageViewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageViewController.addListener(
      () {
        final page = _pageViewController.page ?? 0;
        if (!endReached && page >= (slides.length - 1.5)) {
          setState(() {
            endReached = true;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    // limpia los listener para que no consume recursos
    // TODO: implement dispose
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //permite crear una vista que puede desplazarse horizontal o verticalmente entre varias páginas (vistas) de contenido
      body: Stack(
        children: [
          PageView(
              controller: _pageViewController,
              //BouncingScrollPhysics: Produce un rebote al llegar al final de la página.
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slide) => _Slide(
                      title: slide.title,
                      caption: slide.caption,
                      imageUrl: slide.imageUrl))
                  .toList()),
          Positioned(
              right: 20,
              top: 40,
              child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text('Salir'))),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 20,
                  child: FadeInRight(
                      // que se mueva solo 15 unidades
                      from: 15,
                      delay: Duration(seconds: 1),
                      child: FilledButton(
                          onPressed: () {}, child: Text('Comenzar'))))
              : SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          // En un Column, el eje principal es vertical.
          // En un Row, el eje principal es horizontal.
          // mainAxisAlignment: Para alinear sus hijos a lo largo de su eje principal
          mainAxisAlignment: MainAxisAlignment.center,
          //El eje cruzado es el eje perpendicular al eje principal
          // en column el eje cruzado es el horizontal
          // en row el eje cruzado es le vertical
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(
              height: 20,
            ),
            Text(title, style: titleStyle),
            SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
