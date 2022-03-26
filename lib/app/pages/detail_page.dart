import 'package:flutter/material.dart';
import 'package:pokemon/app/domain/pokemon.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map routeData = {};
  bool showExpandedCard = false;

  @override
  Widget build(BuildContext context) {
    routeData = ModalRoute.of(context)?.settings.arguments as Map;
    Pokemon pokemon = routeData['pokemon'];

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => modifyCardExhibitionState(),
              child: Visibility(
                visible: !showExpandedCard,
                child: Hero(
                  tag: pokemon.id,
                  child: Image.network(pokemon.imageUrl),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => modifyCardExhibitionState(),
              child: Visibility(
                visible: showExpandedCard,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(pokemon.imageUrlHiRes),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  modifyCardExhibitionState() {
    setState(() {
      showExpandedCard = !showExpandedCard;
    });
  }
}
