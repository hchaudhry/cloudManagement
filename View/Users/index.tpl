
<fieldset>
<legend>Liste des utilisateurs</legend>
	<div class="control-group">
                <label class="control-label">Utilisateurs</label>
                <div class="controls">
				<?php foreach ($users as $user) : 
				
					echo $user['id']. " " . $user['login']. " " . $user['motDepasse'];
				
				endforeach; ?>
					
				</div>
	</div>
</fieldset>
