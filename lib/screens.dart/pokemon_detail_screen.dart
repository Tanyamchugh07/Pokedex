import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int herotag;

  const PokemonDetailScreen({super.key,
    required this.pokemonDetail,
    required this.color,
    required this.herotag});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              widget.pokemonDetail['name'],
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Positioned(
            top: height * 0.15,
            left: 30,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.black26,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  widget.pokemonDetail['type'].join(', '),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
              top: 170,
              right: -40,
              child: Image.asset('images/pokeball.png',
                  height: 200, fit: BoxFit.fitHeight)),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Name',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Text(
                            widget.pokemonDetail['name'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Height',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            // width: width * 0.3,
                            child: Text(
                              widget.pokemonDetail['height'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Weight',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            // width: width * 0.3,
                            child: Text(
                              widget.pokemonDetail['weight'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Spawn Time',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            // width: width * 0.3,
                            child: Text(
                              widget.pokemonDetail['spawn_time'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          SizedBox(
                            width: 96,
                            child: const Text(
                              'Weakness',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.54,
                            child: Text(
                              widget.pokemonDetail['weaknesses'].join(","),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Pre Form',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          widget.pokemonDetail['prev_evolution'] != null
                              ? SizedBox(
                            height: 20,
                            width: width * 0.54,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget
                                  .pokemonDetail['prev_evolution'].length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.only(right: 8),
                                  child: Text(
                                    widget.pokemonDetail['prev_evolution']
                                    [index]['name'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              },
                            ),
                          )
                              : const Text(
                            'Just Hatched',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Evolution',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          widget.pokemonDetail['next_evolution'] != null
                              ? SizedBox(
                            height: 20,
                            width: width * 0.54,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget
                                  .pokemonDetail['next_evolution'].length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.only(right: 8),
                                  child: Text(
                                    widget.pokemonDetail['next_evolution']
                                    [index]['name'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              },
                            ),
                          )
                              : const Text(
                            'Maxed Out',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: (width / 2) - 100,
            child: Hero(
              tag: widget.herotag,
              child: CachedNetworkImage(
                imageUrl: widget.pokemonDetail['img'],
                height: 210,
                fit: BoxFit.fitWidth,
              ),
            ),
          )
        ],
      ),
    );
  }
}
