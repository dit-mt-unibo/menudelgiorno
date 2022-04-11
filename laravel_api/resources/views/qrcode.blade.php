<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<hr>


      <h1>mon menu {{ $lan}}</h1>
      <div style="text-align: center">{!!  QrCode::size(150)->generate("http://127.0.0.1:8000/api/generate-qrcode/1")!!}</div>

</body>
