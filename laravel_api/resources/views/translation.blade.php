<!DOCTYPE html>
<html lang="{{$viewModel->languageCode}}">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{$viewModel->menuName}} | {{$viewModel->restaurantName}}</title>
  <link rel="shortcut icon" href="../images/favicon.png" />
  <style>
    @import url("https://fonts.googleapis.com/css2?family=Merriweather:wght@700&display=swap");
    @import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

    * {
      margin: 0;
      padding: 0;
      border: 0;
      font-size: 100%;
      font: inherit;
      vertical-align: baseline;
      line-height: 1;
      box-sizing: border-box;
    }

    html {
      min-height: 100%;
    }

    body {
      background-image: url("../images/translation-background.jpg");
      background-position: center;
      background-size: cover;
    }

    .container {
      width: 1280px;
      height: auto;
      margin: auto;
      padding: 75px;
    }

    .menu-title {
      font-family: "Merriweather", serif;
      font-weight: 700;
      font-size: 68px;
      text-transform: uppercase;
      color: rgb(4, 13, 8);
      margin-bottom: 50px;
    }

    .translation-text {
      font-family: "Poppins", sans-serif;
      font-size: 34px;
      line-height: 58px;
      color: rgb(38, 10, 3);
    }

    @media only screen and (max-width: 1280px) {
      .container {
        width: 100%;
      }

      .menu-title {
        font-size: 58px;
      }

      .translation-text {
        font-size: 30px;
      }
    }

    @media only screen and (max-width: 768px) {
      .menu-title {
        font-size: 48px;
      }

      .translation-text {
        font-size: 26px;
      }
    }

    @media only screen and (max-width: 512px) {
      .menu-title {
        font-size: 26px;
        text-align: center;
      }

      .translation-text {
        font-size: 20px;
        text-align: center;
      }
    }
  </style>
</head>

<body>
  <div class="container">
    <h1 class="menu-title">{{$viewModel->menuName}}</h1>
    <p class="translation-text">{{$viewModel->translationText}}</p>
  </div>
</body>

</html>