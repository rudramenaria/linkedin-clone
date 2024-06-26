class PostService {
  List<Map<String, dynamic>> postJson = [
    {
      "id": 0,
      "about":
          "Ea anim et laboris velit laboris dolor. Ad tempor voluptate amet dolore esse veniam sit eiusmod sunt enim voluptate in dolor dolore. Sunt nisi voluptate minim aute officia id reprehenderit Lorem nisi velit eiusmod laborum in. Lorem duis irure enim fugiat tempor est amet reprehenderit ad deserunt ut ullamco. Velit cillum fugiat commodo commodo.\r\n",
      "likes": 321,
      "comments": 318,
      "created_at": "2024-04-01 13:00:00",
      "connection": "1 st",
      "user": {
        "profile_link": "https://avatar.iran.liara.run/public",
        "name": "Ruth Hurst",
        "occupation": "UI / UX Designer - ZILLACOM"
      }
    },
    {
      "id": 1,
      "about":
          "Minim magna amet tempor amet sunt. Amet ut qui Lorem aliquip. Mollit magna nulla in commodo laboris eu aute in velit adipisicing reprehenderit qui. Ea Lorem sunt magna do incididunt labore. Duis excepteur cupidatat deserunt culpa officia ea anim et proident fugiat. Do ad labore velit cupidatat officia fugiat cupidatat nulla dolore duis. Commodo consectetur consectetur ea sint qui.\r\n",
      "likes": 998,
      "comments": 734,
      "created_at": "2024-04-01 13:00:00",
      "connection": "1 st",
      "user": {
        "profile_link": "https://avatar.iran.liara.run/public",
        "name": "Joann Dale",
        "occupation": "UI / UX Designer - TERASCAPE"
      }
    },
    {
      "id": 2,
      "about":
          "Reprehenderit incididunt excepteur proident incididunt proident cupidatat mollit in ullamco officia aliquip nisi labore. Enim dolor ut aute est. Esse voluptate qui in sit laborum veniam elit. Laboris dolor ea mollit ea ullamco ullamco. Sint nulla ea commodo Lorem aute.\r\n",
      "likes": 361,
      "comments": 507,
      "created_at": "2024-04-01 13:00:00",
      "connection": "1 st",
      "user": {
        "profile_link": "https://avatar.iran.liara.run/public",
        "name": "Aileen Nash",
        "occupation": "UI / UX Designer - CYTREX"
      }
    },
    {
      "id": 3,
      "about":
          "Sint dolore aute ut occaecat ex. Occaecat aute eiusmod Lorem laboris elit esse consequat magna mollit dolor ad irure. Non ea proident quis quis esse id ullamco exercitation magna.\r\n",
      "likes": 940,
      "comments": 680,
      "created_at": "2024-04-01 13:00:00",
      "connection": "1 st",
      "user": {
        "profile_link": "https://avatar.iran.liara.run/public",
        "name": "Ashley Finley",
        "occupation": "UI / UX Designer - ANDRYX"
      }
    },
    {
      "id": 4,
      "about":
          "Consectetur sunt voluptate nisi cupidatat dolor. Adipisicing anim eu nisi amet sunt. Voluptate incididunt officia commodo sit cillum ullamco amet in et veniam laborum nulla. Adipisicing magna adipisicing eu ut voluptate voluptate non amet sit nisi. Ullamco minim minim deserunt et velit do consectetur quis laborum ea eiusmod minim exercitation sunt. Velit enim veniam Lorem do ex fugiat magna est labore ipsum esse nostrud incididunt aliqua.\r\n",
      "likes": 843,
      "comments": 335,
      "created_at": "2024-04-01 13:00:00",
      "connection": "1 st",
      "user": {
        "profile_link": "https://avatar.iran.liara.run/public",
        "name": "Armstrong Ramsey",
        "occupation": "UI / UX Designer - MEDALERT"
      }
    }
  ];

  Future<dynamic> getPosts() async {
    await Future.delayed(Duration(seconds: 1));
    return postJson;
  }
}
