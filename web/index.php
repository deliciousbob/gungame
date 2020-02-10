<?php

require __DIR__ . '/vendor/autoload.php';

use xPaw\SourceQuery\SourceQuery;

$Query = new SourceQuery();
$Query->Connect('127.0.0.1', '27015');

$data = $Query->GetInfo();

?>
<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <title><?php echo $data['HostName']; ?></title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Open Sans', sans-serif;
      color: #FFF;
      background-color: #1E152A
    }

    h1 {
      font-size: 16px;
    }

    #server {
      position: fixed;
      left: 50%;
      top: 300px;
      transform: translate(-50%, -50%);
      margin: 0 auto;
      font-size: 12px;
      text-align: center;
    }

    img {
      border: 1px solid #FFF;
    }
  </style>
</head>

<body>

  <div id="server">
    <a href="https://www.gametracker.com/server_info/5.135.164.88:27015/">
      <img src="https://image.gametracker.com/images/maps/160x120/css/<?php echo $data['Map']; ?>.jpg" />
    </a>
    <p><?php echo $data['HostName']; ?></p>
    <p>
      <?php echo $data['Players']; ?> / <?php echo $data['MaxPlayers']; ?>
    </p>
    <p>
      <a href="steam://connect/5.135.164.88:27015">Join</a> | <a href="/stats">Stats</a>
    </p>
  </div>

</body>

</html>
