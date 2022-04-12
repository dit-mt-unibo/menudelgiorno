<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QR Code | {{ $viewModel->languageName }}</title>
    <link rel="shortcut icon" href="../images/favicon.png" />
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Merriweather:wght@700&display=swap");

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

        svg {
            width: 100%;
            height: auto;
        }

        .container {
            width: 1280px;
            margin: auto;
            padding: 35px;
        }

        .content {
            display: flex;
            flex-flow: column nowrap;
            justify-content: center;
            align-items: center;
            border: 3px solid black;
            border-radius: 35px;
            padding: 35px;
        }

        .code {
            width: 40%;
            height: auto;
            margin-bottom: 20px;
        }

        .language {
            font-family: "Merriweather", serif;
            font-weight: 700;
            font-size: 68px;
            text-transform: uppercase;
        }

        @media only screen and (max-width: 1280px) {
            .container {
                width: 100%;
            }
        }

        @media only screen and (max-width: 768px) {
            .container {
                width: 100%;
            }

            .language {
                font-size: 48px;
            }
        }

        @media only screen and (max-width: 512px) {
            .container {
                width: 100%;
            }

            .language {
                font-size: 36px;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="content">
            <div class="code">{!! $viewModel->qrCodeString !!}</div>
            <p class="language">{{ $viewModel->languageCode }}</p>
        </div>
    </div>
</body>

</html>