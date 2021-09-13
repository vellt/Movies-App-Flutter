# Movies App 🎬

Hi, do you like movies? 😁 Try MoviesApp <a href="https://github.com/vellt/Movies-App/releases/tag/v0.0.1">**here**</a>.  There are currently 4 themes in the app. Search for your favourite movie and add it to your favourites.

![visitors](https://visitor-badge.glitch.me/badge?page_id=vellt/Movies-App) 
![Web 1280 – 1]( https://img.shields.io/badge/-open%20source-green)
[![License](https://img.shields.io/badge/license-MIT-yellow)](./LICENSE)


<details>

<summary><strong>Operating Principle</strong></summary>
  
> <img width="350" alt="multitier_architecture" src="https://user-images.githubusercontent.com/61885011/132905821-d68d4792-3f8f-4660-a648-968f353dcb1c.jpg"> <br> The app sends requests and receives responses from the themoviedb API.  To learn more about `APIs` and the `Multitier architecture` 
  <a href="https://en.wikipedia.org/wiki/Multitier_architecture#Web_development_usage">**click here**</a>.
</details>

![web 1280](https://user-images.githubusercontent.com/61885011/132903284-a8e9f688-39ad-487c-9bc4-6f1404c469bc.png)

## How to run
This application is using api of <a href="https://www.themoviedb.org/">themoviedb</a>, so before using it you have to create an api from <a href="https://www.themoviedb.org/">themoviedb</a> and generate an API and apply it to this application, follow the below step to connect api with this app.

First go to <a href="https://www.themoviedb.org/documentation/api">https://www.themoviedb.org/documentation/api</a>, and follow the API Documentation, you will get the API Code.

- go to `lib/secret/themoviedb_api.dart`
- you will see the code like this

```dart
const String themoviedbApi = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
```
- replace the all `xx..` to your API, like this

```dart
const String themoviedbApi = 'your_api_code_here';
```
- enjoy coding ❤️

## Contributors changes

- `11/09/21 -  Rohit Chouhan: `<br>
 Added the missing file <a href="https://github.com/vellt/Movies-App-Flutter/blob/main/lib/secret/themoviedb_api.dart">secret/themoviedb_api.dart</a> for running the project and the exact <a href="https://github.com/vellt/Movies-App-Flutter#how-to-run">documentation</a> for its correct use of the api file.
