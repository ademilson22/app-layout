import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Responsivo - Rede Social',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rede Social Responsiva'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Se a largura da tela for menor que 600px, o layout será em coluna (mobile)
            if (constraints.maxWidth < 600) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileCard(),
                    PostCard(title: "Postagem 1", content: "Este é o conteúdo da postagem 1"),
                    PostCard(title: "Postagem 2", content: "Este é o conteúdo da postagem 2"),
                    PostCard(title: "Postagem 3", content: "Este é o conteúdo da postagem 3"),
                  ],
                ),
              );
            } else {
              // Se a largura for maior que 600px, o layout será dividido entre a barra lateral e o conteúdo (desktop)
              return Row(
                children: [
                  // Barra lateral visível em telas maiores
                  NavigationDrawer(),
                  // Espaço principal com perfil e postagens
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileCard(),
                          SizedBox(height: 20),
                          // Cards de postagens lado a lado
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              PostCard(title: "Postagem 1", content: "Este é o conteúdo da postagem 1"),
                              SizedBox(width: 20),
                              PostCard(title: "Postagem 2", content: "Este é o conteúdo da postagem 2"),
                              SizedBox(width: 20),
                              PostCard(title: "Postagem 3", content: "Este é o conteúdo da postagem 3"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.blue[100],
      child: Column(
        children: [
          ListTile(
            title: Text('Início'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Mensagens'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Notificações'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Configurações'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://www.example.com/profile_pic.jpg'),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('João da Silva', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('@joaosilva', style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String title;
  final String content;

  const PostCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }
}

