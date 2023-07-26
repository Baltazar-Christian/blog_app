import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FriendListScreen(),
    );
  }
}

class FriendListScreen extends StatefulWidget {
  @override
  _FriendListScreenState createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen> {
  final List<String> friends = [
    "John Doe",
    "Alice Smith",
    "Bob Johnson",
    "Emma Brown",
    "Michael Lee",
    "Sophia Wilson",
    "William Davis",
    "Olivia Martinez",
    "James Taylor",
    "Emily Garcia",
  ];

  List<String> filteredFriends = [];

  @override
  void initState() {
    super.initState();
    filteredFriends = friends;
  }

  void _filterFriends(String query) {
    setState(() {
      filteredFriends = friends
          .where((friend) => friend.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Friend List'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final String? result = await showSearch(
                context: context,
                delegate: FriendSearchDelegate(filteredFriends),
              );
              if (result != null) {
                // Handle search result if needed
                print('Searched friend: $result');
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredFriends.length,
        itemBuilder: (context, index) {
          final friendName = filteredFriends[index];
          return FriendListItem(
            name: friendName,
            onViewDetail: () => _showToast('Viewing details of $friendName'),
            onMessage: () => _navigateToChatScreen(context, friendName),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showToast('Add Friend'),
        child: Icon(Icons.person_add),
      ),
    );
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  void _navigateToChatScreen(BuildContext context, String friendName) {
    // Replace this with your actual chat screen navigation logic
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(friendName: friendName),
      ),
    );
  }
}

class FriendListItem extends StatelessWidget {
  final String name;
  final VoidCallback onViewDetail;
  final VoidCallback onMessage;

  FriendListItem({
    required this.name,
    required this.onViewDetail,
    required this.onMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(
          Icons.person,
          size: 50,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle:
            Text('Status: Online'), // Replace with your friend's online status
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.info),
              onPressed: onViewDetail,
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: onMessage,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final String friendName;

  ChatScreen({required this.friendName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $friendName'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Implement the chat messages display here
                // Example: ChatMessage(text: 'Hello!'),
                // Example: ChatMessage(text: 'Hi there!'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Implement sending the message logic here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FriendSearchDelegate extends SearchDelegate<String> {
  final List<String> friends;

  FriendSearchDelegate(this.friends);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final friendName = friends[index];
        return ListTile(
          title: Text(friendName),
          onTap: () {
            close(context, friendName);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredFriends = friends
        .where((friend) => friend.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredFriends.length,
      itemBuilder: (context, index) {
        final friendName = filteredFriends[index];
        return ListTile(
          title: Text(friendName),
          onTap: () {
            close(context, friendName);
          },
        );
      },
    );
  }
}
