<!DOCTYPE html>
<html lang="{{ $viewModel->languageCode }}">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $viewModel->menuName }} | {{ $viewModel->restaurantName }}</title>
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

        html,
        body {
            height: 100%;
        }

        body {
            height: 100%;
            background-image: url("../images/menud.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .container {
            width: 100%;
            height: auto;
            margin: auto;
            padding: 75px;
        }

        .menu-title {
            font-family: "Merriweather", serif;
            font-weight: 700;
            font-size: 50px;
            text-transform: uppercase;
            color: rgb(236, 78, 4);
            margin-bottom: 50px;
        }

        .translation-text {
            font-family: "Poppins", sans-serif;
            font-size: 45px;
            line-height: 58px;
            font-weight: 400;
            color: rgba(255, 255, 255, 0.92);
        }

        @media only screen and (max-width: 1280px) {
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
                font-size: 40px;
            }
        }

        @media only screen and (max-width: 512px) {
            .menu-title {
                font-size: 30px;
                text-align: center;
            }

            .translation-text {
                font-size: 28px;
                text-align: center;
            }
        }

    </style>
</head>

<body>
    <div class="container">
        <h1 class="menu-title">{{ $viewModel->menuName }}</h1>
        <p class="translation-text">{{ $viewModel->translationText }}</p>
    </div>
</body>

</html>
