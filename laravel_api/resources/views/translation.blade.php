<!DOCTYPE html>
<html lang="{{$viewModel->languageCode}}">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{$viewModel->menuName}} | {{$viewModel->restaurantName}}</title>
  <link rel="shortcut icon" href="../images/favicon.png" />
  <link rel="stylesheet" href="../css/app.css" />
</head>

<body>
  <div class="container">
    <h1 class="menu-title">{{$viewModel->menuName}}</h1>
    <p class="translation-text">{{$viewModel->translationText}}</p>
  </div>
</body>

</html>