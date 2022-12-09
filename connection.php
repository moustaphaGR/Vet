<?php
require_once "config.php";
?>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Connection</title>
  <link rel="stylesheet" href="connection.css">
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Rubik:400,700'><link rel="stylesheet" href="./style.css">

</head>
<body>
  <?php
    if(isset($_POST['submit'])){
      $email=$_POST['Email'];
      $passw=$_POST['Password'];

      $sql= "SELECT Email, Mot_de_Passe FROM client WHERE Email = '$email' AND Mot_de_Passe = '$passw'";

      $stmtinsert = $db->prepare($sql);
      $result = $stmtinsert->execute([$email, $passw]);

      if($result){
          header('location: client_dashboard.php');
          exit();
      }
      else{
          header('location: connection.php');
          exit();
      }
    }
  ?>
  <div class="navbar">
    <div class="links">
        <a href="accueil.php">Accueil</a>
        <a href="#">Galerie</a>
        <a href="#">Nous Contacter</a>
    </div>
  </div>
  <div class="login-form">
    <form method="POST" action="#">
      <div class="content">
        <div class="input-field">
          <input type="email" name="Email" placeholder="Email" autocomplete="nope" required>
        </div>
        <div class="input-field">
          <input type="password" name="Password" placeholder="Password" autocomplete="new-password" required>
        </div>
        <a href="#" class="link">Mot de passe oublié?</a>
      </div>
      <div class="action">
        <button name="submit" type="submit">Connecter</button>
      </div>
    </form>
    <button ><a class="signup" href="inscription.php">S'inscrire</a></button>
  </div>
  <script  src="./script.js"></script>

</body>
</html>
