<!DOCTYPE html>
<html>
<head>
	<title><?=$title?> &middot; <?=$site_title?></title>
	<style>
		.container {
			display: block;
			border-collapse: collapse;
		}
		.barcode-container {
			display: table-cell;
			border: #cecece 2px solid;
			break-after: 3;
		}
		.barcode {
			margin-top: 6px;
		}
	</style>
</head>
<body onload="window.print()">
	<div class="container">
		<?php for ($x=1;$x<=40;$x++): ?>
		<div class="barcode-container">
			<img class="barcode" src="<?=base_url('barcode.php?barcode='.$info['id'].'&width=230&text='.$info['id'])?>" alt="" />
		</div><!-- /.barcode-container -->
		<?php if (($x % 4) == 0): ?>
			<br />
		<?php endif ?>
		<?php endfor ?>
	</div><!-- /.container -->
</body>
</html>