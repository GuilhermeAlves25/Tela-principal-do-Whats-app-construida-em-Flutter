import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    const Color whatsAppGreen = Color(0xFF075E54);
    const Color whatsAppGreenLight = Color(0xFF25D366);

    return MaterialApp(
      title: 'WhatsApp Clone',

      theme: ThemeData(
        primaryColor: whatsAppGreen,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: whatsAppGreen,
          secondary: whatsAppGreenLight,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: whatsAppGreen,
          foregroundColor: Colors.white,
        ),


        tabBarTheme: const TabBarThemeData(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.blue,
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.camera_alt_outlined)),
              Tab(text: 'CONVERSAS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CHAMADAS'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Tela acesso a camera')),
            ChatListPage(),
            StatusPage(),
            Center(child: Text('Tela de Chamadas')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Botão de nova conversa clicado!');
          },
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: const Icon(Icons.message, color: Colors.white),
        ),
      ),
    );
  }
}


class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {

        String imageUrl = 'https://i.pravatar.cc/150?img=${index + 1}';

        return ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Text(
            'Contato ${index + 1}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('Olá! Esta é a última mensagem.'),
          trailing: const Text(
            '12:34',
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }
}

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
          ),
          title: Text(
            'Meu status',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Toque para atualizar seu status'),
        ),


        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0),
          child: Text(
            'Atualizações recentes',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),


        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 28,

                  backgroundColor: Colors.green,
                  child: CircleAvatar(
                    radius: 26,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${index + 10}'),
                  ),
                ),
                title: Text(
                  'Contato ${index + 2}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Hoje, 10:30'),
              );
            },
          ),
        ),
      ],
    );
  }
}