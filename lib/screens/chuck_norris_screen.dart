import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chuck_norris_provider.dart';

class ChuckNorrisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chuckNorrisProvider = Provider.of<ChuckNorrisProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chuck Norris Joke'),
      ),
      body: Center(
        child: chuckNorrisProvider.isLoading
            ? CircularProgressIndicator()
            : chuckNorrisProvider.joke == null
                ? Text('Failed to load joke')
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://api.chucknorris.io/img/avatar/chuck-norris.png',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 20),
                        Text(
                          chuckNorrisProvider.joke!.joke,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          chuckNorrisProvider.fetchJoke();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
