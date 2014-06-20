<div class="span5 offset3 container">
	<div class="row">
		 <form id="productForm" class="form-horizontal" action="index.php?module=addStock" method="post">
            <fieldset>	
		
			<div id="legend">
      
    			<?php if(empty($stock)){ 
          			echo "<legend>Ajout d'un produit</legend>";
          			}else{
            		echo "<legend>Modification d'un produit</legend>";
          			}		
    			?>
    		</div>
    			
			<?php if(empty($stock['id'])){ 
				 		echo "<input type='hidden' name='id' id='num' class='input-xlarge'>";
					}else{
						echo "<input type='hidden' name='id' id='num' class='input-xlarge' value=".$stock['id'].">";
					}
			?>
			
			<div class="control-group">
                    <label class="control-label">Référence <span class="star-color">*</span></label>
                    <div class="controls">
						<?php if(empty($stock['reference'])){ 
				 			echo "<input type=text name='ref' class='input-xlarge'>";
						}else{
							echo "<input type=text name='ref' class='input-xlarge' value=".$stock['reference'].">";
						}
						?>
						<p class="help-block"></p>
                    </div>
             </div>
             
             <div class="control-group">
                    <label class="control-label">Nom <span class="star-color">*</span></label>
                    <div class="controls">
						<?php if(empty($stock['name'])){ 
				 			echo "<input type=text name='nom' class='input-xlarge'>";
						}else{
							echo "<input type=text name='nom' class='input-xlarge' value=".$stock['name'].">";
						}
						?>
						<p class="help-block"></p>
                    </div>
             </div>
             
             <div class="control-group">
                    <label class="control-label">Description <span class="star-color">*</span></label>
                    <div class="controls">
						<?php if(empty($stock['description'])){ 
				 			echo "<TEXTAREA rows='3' name='commentaires' class='input-xlarge'></TEXTAREA>";
						}else{
							echo "<TEXTAREA rows='3' name='commentaires' class='input-xlarge'>". $stock['description'] ."</TEXTAREA>";
						}
						?>
						<p class="help-block"></p>
                    </div>
             </div>

<!--              <div class="control-group"> -->
<!--                     <label class="control-label">Fournisseur</label> -->
<!--                     <div class="controls"> -->
<!-- 				 			<SELECT name="fourni" class='input-xlarge'> -->
<!-- 								<option value="fourni1"> Fourni 1 </option> -->
<!-- 								<option value="fourni2"> Fourni 2 </option> -->
<!-- 								<option value="fourni3"> Fourni 3 </option> -->
<!-- 							</SELECT> -->
<!-- 						<p class="help-block"></p> -->
<!--                     </div> -->
<!--              </div> -->
             
             <div class="control-group">
                    <label class="control-label">Quantité disponible <span class="star-color">*</span></label>
                    <div class="controls">
						<?php if(empty($stock['quantity'])){ 
				 			echo "<input type=text name='qte' class='input-xlarge'>";
						}else{
							echo "<input type=text name='qte' class='input-xlarge' value=".$stock['quantity'].">";
						}
						?>
						<p class="help-block"></p>
                    </div>
             </div>
			
			<div class="control-group">
                    <label class="control-label">Prix <span class="star-color">*</span></label>
                    <div class="controls">
						<?php if(empty($stock['price'])){ 
				 			echo "<input type=text name='prix' class='input-xlarge'>";
						}else{
							echo "<input type=text name='prix' class='input-xlarge' value=".$stock['price'].">";
						}
						?>
						<p class="help-block"></p>
                    </div>
            </div>
			
			<div class="control-group">
                    <label class="control-label">Seuil d'alerte actif</label>
                    <div class="controls">
						<?php if(empty($stock['seuil_active'])){ 
				 			echo "<input type='checkbox' id='seuilactif' name='seuilactif' value='1'>";
						}else{
							echo "<input type='checkbox' id='seuilactif' name='seuilactif' checked value='1'>";
						}
						?>
						<p class="help-block"></p>
                    </div>
             </div>
             
             <div class="control-group">
                    <label class="control-label">Seuil d'alerte</label>
                    <div class="controls">
						<?php if(empty($stock['seuil_value'])){ 
				 			echo "<input type=text name='seuil' class='input-xlarge'>";
						}else{
							echo "<input type=text name='seuil' class='input-xlarge' value=".$stock['seuil_value'].">";
						}
						?>
						<p class="help-block"></p>
                    </div>
             </div>

<!--              <div class="control-group"> -->
<!--                     <label class="control-label">Client</label> -->
<!--                     <div class="controls"> -->
<!-- 				 			<SELECT name="client" class='input-xlarge'> -->
<!-- 								<option value="client1"> Client 1 </option> -->
<!-- 								<option value="client2"> Client 2 </option> -->
<!-- 								<option value="client3"> Client 3 </option> -->
<!-- 							</SELECT> -->
<!-- 						<p class="help-block"></p> -->
<!--                     </div> -->
<!--              </div> -->

			<div class="span3 offset2">
	            <button type="button" class="btn btn-danger">Annuler</button>
	            <button type="submit" class="btn btn-success">Valider</button>
            </div>
		</fieldset>
        </form>
	</div>
</div>
