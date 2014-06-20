<div class="span5 offset3 container">
	<div class="row">
		 <form id="supplierForm" class="form-horizontal" action="index.php?module=addSupplier" method="post">
            <fieldset>
         
                <h3>Ajout de fournisseur</h3>

                <?php if(empty($supplier['id'])){ 
                        echo "<input type='hidden' name='id'>";
                    }else{
                        echo "<input type='hidden' name='id' value=".$supplier['id'].">";
                    }
                ?>
                  
                <div class="control-group">
                    <label class="control-label">Nom <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($supplier['name'])){ 
                                echo "<input id='nom' name='nom' type='text' placeholder='Nom' class='input-xlarge'>";
                            }else{
                                echo "<input id='nom' name='nom' type='text' placeholder='Nom' class='input-xlarge' value=".$supplier['name'].">";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Société <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($supplier['society'])){ 
                                echo "<input id='societe' name='societe' type='text' placeholder='Société' class='input-xlarge'>";
                            }else{
                                echo "<input id='societe' name='societe' type='text' placeholder='Société' class='input-xlarge' value=".$supplier['society'].">";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>
         
                <div class="control-group">
                    <label class="control-label">Adresse <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($supplier['society'])){ 
                                echo "<input id='adresse' name='adresse' type='text' placeholder='adresse' class='input-xlarge'>";
                            }else{
                                echo "<input id='adresse' name='adresse' type='text' placeholder='adresse' class='input-xlarge' value=".$supplier['adress'].">";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Ville <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($supplier['city'])){ 
                                echo "<input id='ville' name='ville' type='text' placeholder='Ville' class='input-xlarge'>";
                            }else{
                                echo "<input id='ville' name='ville' type='text' placeholder='Ville' class='input-xlarge' value=".$supplier['city'].">";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Code Postal <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($supplier['cp'])){ 
                                echo "<input id='code-postal' name='codePostal' type='text' placeholder='12345' class='input-xlarge'>";
                            }else{
                                echo "<input id='code-postal' name='codePostal' type='text' placeholder='12345' class='input-xlarge' value=".$supplier['cp'].">";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Téléphone <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($supplier['phone'])){ 
                                echo "<input id='telephone' name='telephone' type='text' placeholder='0123456789' class='input-xlarge'>";
                            }else{
                                echo "<input id='telephone' name='telephone' type='text' placeholder='0123456789' class='input-xlarge' value=".$supplier['phone'].">";
                            }
                        ?>
                        <p class="help-block"></p>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Email <span class="star-color">*</span></label>
                    <div class="controls">
                        <?php if(empty($supplier['email'])){ 
                                echo "<input id='email' name='email' type='text' placeholder='exemple@mail.com' class='input-xlarge'>";
                            }else{
                                echo "<input id='email' name='email' type='text' placeholder='exemple@mail.com' class='input-xlarge' value=".$supplier['email'].">";
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

<script type="text/javascript">

</script>