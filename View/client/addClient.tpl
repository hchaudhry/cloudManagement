<div class="span5 offset3 container">
	<div class="row">
		 <form id="clientForm" class="form-horizontal" action="index.php?module=addClient" method="post">
            <fieldset>
            <div id="legend">
      
    			<?php if(empty($client)){ 
          			echo "<legend>Ajout d'un client</legend>";
          			}else{
            		echo "<legend>Modification d'un client</legend>";
          			}		
    			?>
    		</div>

                <?php if(empty($client['id'])){ 
                        echo "<input type='hidden' name='id'>";
                    }else{
                        echo "<input type='hidden' name='id' value=".$client['id'].">";
                    }
                ?>
                  
                <div class="control-group">
                    <label class="control-label">Nom <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($client['name'])){ 
                                echo "<input id='nom' name='nom' type='text' placeholder='Nom' class='input-xlarge'>";
                            }else{
                                echo "<input id='nom' name='nom' type='text' placeholder='Nom' class='input-xlarge' value='".$client['name']."'>";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Société <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($client['society'])){ 
                                echo "<input id='societe' name='societe' type='text' placeholder='Société' class='input-xlarge'>";
                            }else{
                                echo "<input id='societe' name='societe' type='text' placeholder='Société' class='input-xlarge' value='".$client['society']."'>";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>
         
                <div class="control-group">
                    <label class="control-label">Adresse <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($client['society'])){ 
                                echo "<input id='adresse' name='adresse' type='text' placeholder='adresse' class='input-xlarge'>";
                            }else{
                                echo "<input id='adresse' name='adresse' type='text' placeholder='adresse' class='input-xlarge' value='".$client['adress']."'>";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Ville <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($client['city'])){ 
                                echo "<input id='ville' name='ville' type='text' placeholder='Ville' class='input-xlarge'>";
                            }else{
                                echo "<input id='ville' name='ville' type='text' placeholder='Ville' class='input-xlarge' value=".$client['city'].">";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Code Postal <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($client['cp'])){ 
                                echo "<input id='code-postal' name='codePostal' type='text' placeholder='12345' class='input-xlarge'>";
                            }else{
                                echo "<input id='code-postal' name='codePostal' type='text' placeholder='12345' class='input-xlarge' value=".$client['cp'].">";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Téléphone <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($client['phone'])){ 
                                echo "<input id='telephone' name='telephone' type='text' placeholder='0123456789' class='input-xlarge'>";
                            }else{
                                echo "<input id='telephone' name='telephone' type='text' placeholder='0123456789' class='input-xlarge' value=".$client['phone'].">";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Email <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($client['email'])){ 
                                echo "<input id='email' name='email' type='text' placeholder='exemple@mail.com' class='input-xlarge'>";
                            }else{
                                echo "<input id='email' name='email' type='text' placeholder='exemple@mail.com' class='input-xlarge' value=".$client['email'].">";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>
                <span class="span2"><span class="star-color">*</span> : Champ obligatoire</span>

                <div class="span3 offset2">
                    <button type="button" class="btn btn-danger">Annuler</button>
                    <button type="submit" class="btn btn-success">Valider</button>
                </div>
                
            </fieldset>
        </form>
	</div>
</div>
