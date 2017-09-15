<!DOCTYPE html>
<html>
	<head>
		<title><?=$title?> &middot; <?=$site_title?></title>
		<link rel="stylesheet" href="<?=base_url('assets/custom/css/print.css')?>" />
	</head>
	<body onload="javascript:print()">
		
		<?php $this->load->view('inc/print_header');?>
		<div class="container">
			<h3>Total Inventory Report</h3>			
			<div class="content">
				<table class="items">
					<thead>
						<tr>
							<th></th>
							<th>Item ID</th>
							<th>Name</th>
							<th>Serial</th>
							<th>Category</th>
							<th>Brand</th>
							<th>DP</th>
							<th>SRP</th>
							<th>QTY</th>
						</tr>
					</thead>
					<tbody>
						<?php if ($items): $x=1; ?>
						<?php foreach ($items as $item): $qty[]=$item['qty'];?>
						<tr>
							<td class="text-center"><?=$x++?>.</td>
							<td><?=$item['id']?></td>
							<td><?=$item['name']?></td>
							<td><?=$item['serial']?></td>
							<td><?=$item['category']?></td>
							<td><?=$item['brand']?></td>
							<td><?=$item['DP']?></td>
							<td><?=$item['SRP']?></td>
							<td><?=$item['qty']?></td>							
						</tr>
						<?php endforeach ?>
						<?php else: ?>
						<tr>
							<td colspan="4">No items found!</td>
						</tr>
						<?php endif ?>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="8" class="text-right">Overall Quantity</th>
							<td><?=array_sum($qty)?></td>
						</tr>
					</tfoot>
					</table><!-- /.items -->
					</div><!-- /.content -->

			<div class="content">
				<span class="content-title">Total Items: </span>
				<span class="content-detail"><?=$total_items?></span>
			</div><!-- /.content -->
					<div class="signature-container">
						<div class="signature" style="width: 200px;">
							<span class="signee"><?=$user['name']?></span>
							<span class="signee-title">Verified and Printed by</span>
							</div><!-- /.signature -->
							</div><!-- /.signature-container -->
							<small class="print-stamp">Printed: <?=unix_to_human(now())?></small>
							</div><!-- /.container -->
						</body>
					</html>