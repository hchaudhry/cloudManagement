<div class="form-horizontal">
	<div class="control-group">
	  <label class="control-label">Dates : </label>
	  <div class="controls">
	    <div class="row-fluid">
	      <div class="span2 dateinput">
	        <input type="text" id="beginDate" class="input-small dates" name="beginDate" value="" placeholder="aaaa-mm-jj">
	      </div>
	      <div class="span2 dateinput">
	        <input type="text" id="endDate" class="input-small dates" name="endDate" value="" placeholder="aaaa-mm-jj">
	      </div>
	      <div class="span2">
	        <button id="stats" class="btn btn-primary" type="button">Statistique</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>

<hr>

<div class="span12">
	<input type="hidden" id="productName" value="<?php if(!empty($stockInfo)){ echo $stockInfo['name']; } ?>">
	<table border="1">
	  <tr>
	 	<td></td>
	  	<?php if(!empty($stock)){

			foreach($stock as $value){
				echo "<th scope='col'>".$value['saleDate']."</th>";
			}
		}
		?>
	  </tr>
	  <tr>
	  	<th scope="row"><?php if(!empty($stockInfo)) { echo $stockInfo['name']; } ?></th>
	    <?php if(!empty($stock)){ 
			
				foreach($stock as $value){
					echo "<td>".$value['quantity']."</td>";
				}
			}
		?>
	  </tr>
	</table>
</div>

<link media="screen" href="css/visualize.css" type="text/css" rel="stylesheet" />
<link media="screen" href="css/visualize-light.css" type="text/css" rel="stylesheet" />
<link media="screen" href="js/bootstrap-datepicker/css/datepicker.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js"></script>
<script type="text/javascript" src="js/excanvas.js"></script>
<script type="text/javascript" src="js/visualize.jQuery.js"></script>

<script type="text/javascript">
	$(function(){
		var titre = 'Évolution du stock pour ' + $('#productName').val();
		$('table').hide();
		$('table').visualize({type: 'line', title: titre, width: 800, height: 400});
		$('.visualize').css({"margin-left": "auto", "margin-right": "auto", "margin-top": "-10px", "margin-bottom": "20px"});
		$('.label').css('background-color', 'transparent');
		$('.dateinput').css('width', '10%');
		
		$('.dates').datepicker({
	        format: "yyyy-mm-dd",
	        language: "fr",
	        todayHighlight: true
	    });
	});
</script>
 