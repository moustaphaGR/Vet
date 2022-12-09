<?php
require_once "config.php";
?>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Inscription</title>
  <link rel="stylesheet" href="connection2.css">
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Rubik:400,700'><link rel="stylesheet" href="./style.css">

</head>
<body>
  <div>
  <?php
      if(isset($_POST['create'])){
        $Nom = $_POST['Nom'];
        $Prenom = $_POST['Prenom'];
        $Email = $_POST['Email'];
        $Password = $_POST['Password'];

        $sql = "INSERT INTO client (Nom, Prenom, Email, Mot_de_Passe) VALUES (?,?,?,?)";
        $stmtinsert = $db->prepare($sql);
        $result = $stmtinsert->execute([$Nom, $Prenom, $Email, $Password]);
        if ($result) {
          echo 'Enregistré avec succès';
        }else {
          echo 'il y a eu une erreur lors de l\'enregistrement des données';
        }
      }
    ?>
  </div>
    <div class="navbar">
        <div class="links">
            <a href="accueil.php">Accueil</a>
            <a href="#">Galerie</a>
            <a href="#">Nous Contacter</a>
        </div>
      </div>
  <div class="login-form">
    <form action="inscription.php" method="post">
      <div class="content">
        <div class="input-field">
          <input type="email" placeholder="Email" id="Email" name="Email" autocomplete="nope" required>
        </div>
        <div class="input-field">
          <input type="password" placeholder="Password" id="Password" name="Password" autocomplete="new-password" required>
        </div>
        <div class="input-field">
          <input type="text" placeholder="Prenom" id="Prenom" name="Prenom" autocomplete="new-prenom" required>
        </div>
        <div class="input-field">
          <input type="text" placeholder="Nom" id="Nom" name="Nom" autocomplete="new-nom" required>
        </div>
        <div class="input-field">
          <input type="tel" placeholder="Telephone" id="Telephone" name="Telephone" autocomplete="new-telephone">
        </div>
        <a href="#" class="link"></a>
      </div>
      <div class="action">
        <button id="inscrire" name="create" type="submit">Créer</button>
      </div>
    </form>
  </div>
  <script  src="./script.js"></script>
</body>
</html>
