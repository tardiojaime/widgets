import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinity_scroll';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  // bandera para ver si sigue montado el widget
  bool isMounted = true;

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // se ejecuta cuando el widget es cerrado o eliminado
    // utilizamos para cancelar proceso, para liberar espacio
    isMounted = false;
    scrollController.dispose();
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
// verificamos que siga montado el widget
    if (!isMounted) {
      return;
    }
    setState(() {});
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 200 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(scrollController.position.pixels + 220,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((elemet) => lastId + elemet));
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;
    final lastid = imagesIds.last;
    isLoading = false;
    imagesIds.clear();
    imagesIds.add(lastid + 1);
    addFiveImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: RefreshIndicator(
            onRefresh: () => onRefresh(),
            // icono de loading  baje mas abajo
            edgeOffset: 10,
            child: ListView.builder(
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    placeholder: const AssetImage('assets/img/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/id/${imagesIds[index]}/400/300'));
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => context.pop(),
            child: isLoading
                ? SpinPerfect(
                    infinite: true, child: const Icon(Icons.refresh_rounded))
                : FadeIn(
                    child: const Icon(Icons.arrow_back_ios_new_outlined))));
  }
}
