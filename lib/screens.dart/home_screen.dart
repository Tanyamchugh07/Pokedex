import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/screens.dart/pokemon_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  List Pokedex = [];
  List filteredPokedex = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokemon',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Pokemon',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                  filteredPokedex = Pokedex.where((pokemon) {
                    var name = pokemon['name'].toString().toLowerCase();
                    return name.contains(searchQuery);
                  }).toList();
                });
              },
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 20, // Adjusted to fit search bar
                  bottom: 0,
                  width: width,
                  child: Column(
                    children: [
                      filteredPokedex.isNotEmpty
                          ? Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: filteredPokedex.length,
                          itemBuilder: (context, index) {
                            var type = filteredPokedex[index]['type'].join(', ');
                            return InkWell(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: getColorByType(type),
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: -10,
                                        right: -10,
                                        child: Image.asset(
                                          'images/pokeball.png',
                                          height: 60,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              filteredPokedex[index]['name'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.5,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 4, bottom: 4, right: 8),
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                                color: Colors.black26,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Text(
                                                  type,
                                                  style: const TextStyle(color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 4,
                                        right: 1,
                                        child: Hero(
                                          tag: index,
                                          child: CachedNetworkImage(
                                            imageUrl: filteredPokedex[index]['img'],
                                            height: 85,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PokemonDetailScreen(
                                      pokemonDetail: filteredPokedex[index],
                                      color: getColorByType(type),
                                      herotag: index,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      )
                          : const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchPokemonData() async {
    var url = Uri.parse(pokeApi);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedJsonData = jsonDecode(response.body);
      setState(() {
        if (decodedJsonData != null && decodedJsonData['pokemon'] != null) {
          Pokedex = List.from(decodedJsonData['pokemon']);
          filteredPokedex = Pokedex; // Initially, show all Pokémon
        } else {
          Pokedex = [];
          filteredPokedex = [];
        }
      });
    }
  }

  Color getColorByType(String type) {
    switch (type) {
      case 'Grass, Poison':
        return Colors.green;
      case 'Fire':
        return Colors.red;
      case 'Fire, Flying':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Electric':
        return Colors.yellow;
      case 'Rock':
        return Colors.grey;
      case 'Rock, Water':
        return Colors.pink;
      case 'Ground':
        return Colors.brown;
      case 'Psychic':
        return Colors.indigo;
      case 'Ghost':
        return Colors.purple;
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.deepOrange;
      case 'Poison, Ground':
        return Colors.cyanAccent;
      case 'Poison, Flying':
        return Colors.orange;
      case 'Bug, Poison':
        return Colors.lightGreen;
      case 'Bug':
        return Colors.lightGreenAccent;
      case 'Normal, Flying':
        return Colors.black26;
      case 'Dragon, Flying':
        return Colors.amber;
      case 'Dragon':
        return Colors.teal;
      default:
        return Colors.cyan;
    }
  }
}
