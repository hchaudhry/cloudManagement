<form class="form-horizontal" action='index.php?module=addUser' method="POST">
  <fieldset>
    <div id="legend">
      
    <?php if(empty($user)){ 
          	echo "<legend>Ajout d'un utilisateur</legend>";
          }else{
            echo "<legend>Modification d'un utilisateur</legend>";
          }
    ?>
    </div>
    <?php if(empty($user['id'])){ 
          	echo "<input type='hidden' name='id'>";
          }else{
            echo "<input type='hidden' name='id' value=".$user['id'].">";
          }
    ?>
    <div class="control-group">
      <label class="control-label"  for="lastname">Nom</label>
      <div class="controls">
        <?php if(empty($user['lastname'])){ 
          	echo "<input type='text' id='lastname' name='lastname' class='input-xlarge'>";
          }else{
            echo "<input type='text' id='lastname' name='lastname' class='input-xlarge' value=".$user['lastname'].">";
          }
    	?>
      </div>
    </div>
 
    <div class="control-group">
      <label class="control-label" for="firstname">Prénom</label>
      <div class="controls">
        <?php if(empty($user['firstname'])){ 
          	echo "<input type='text' id='firstname' name='firstname' class='input-xlarge'>";
          }else{
            echo "<input type='text' id='firstname' name='firstname' class='input-xlarge' value=".$user['firstname'].">";
          }
    	?>
      </div>
    </div>
    
    <div class="control-group">
      <label class="control-label"  for="username">Login</label>
      <div class="controls">
        <?php if(empty($user['login'])){ 
          	echo "<input type='text' id='login' name='login' class='input-xlarge'>";
          }else{
            echo "<input type='text' id='login' name='login' class='input-xlarge' value=".$user['login'].">";
          }
    	?>
      </div>
    </div>
 
    <div class="control-group">
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
        <?php if(empty($user['email'])){ 
          	echo "<input type='text' id='email' name='email' class='input-xlarge'>";
          }else{
            echo "<input type='text' id='email' name='email' class='input-xlarge' value=".$user['email'].">";
          }
    	?>
      </div>
    </div>
 
    <div class="control-group">
      <label class="control-label" for="password">Mot de passe</label>
      <div class="controls">
        <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
      </div>
    </div>
 
    <div class="control-group">
      <label class="control-label"  for="password_confirm">Mot de passe (Confirmation)</label>
      <div class="controls">
        <input type="password" id="password_confirm" name="password_confirm" placeholder="" class="input-xlarge">
      </div>
    </div>
 
    <div class="control-group">
      <div class="controls">
        <button class="btn btn-success">Enregister</button>
      </div>
    </div>
  </fieldset>
</form>