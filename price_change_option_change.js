$(function() {if ($('.product-info [name=\'quantity\']').val() > 1) getLatestprice()});
$(document).on('change','[name^=\'option[\']', getLatestprice);
$(document).on('keyup','[name=\'quantity\']', function() {
	if (!isNaN(this.value) && this.value > 0) getLatestprice();
});
$(document).on('click', '.qty-plus', function() {
    var heading_title = $('.product-info .page-header h1').text().toLowerCase();
    if (!isNaN($('.product-info [name="quantity"]').val()) && $('.product-info [name="quantity"]').val() > 0) {
        getLatestprice();
    }
});

$(document).on('click', '.qty-minus', function() {
    var heading_title = $('.product-info .page-header h1').text().toLowerCase();
    if (!isNaN($('.product-info [name="quantity"]').val()) && $('.product-info [name="quantity"]').val() > 0) {
        getLatestprice();
    }
});

$(document).ready(function() {
    // Click event handler for close button within #notification
    $('#notification').on('click', '.close', function() {
        $(this).closest('.success').fadeOut();
    });
});


var alreadyExec;

function getLatestprice() {

	if (alreadyExec) alreadyExec.abort();

	alreadyExec = $.ajax({
		url: 'index.php?route=module/price_change_option_change/getLatestPriceprice',
		type: 'post',
		data: $('.product-info [name=\'quantity\'],.product-info [type=\'radio\']:checked, .product-info [type=\'checkbox\']:checked,  .product-info select, .product-info [name=\'product_id\']'),
		dataType: 'json',
		success: function(response) {
            const multiplier = parseFloat($('.multiplier').text()) || 1; // Default to 1 if not found
            const quantity = parseFloat($('.product-info [name="quantity"]').val()) || 1; // Default to 1 if quantity is not valid
            const totalUnits = multiplier * quantity;

            const formattedTotalUnits = totalUnits.toLocaleString();
            const unitText = totalUnits === 1 ? 'unit' : 'units'; // Determine singular/plural

			$('.price-container').text(response.price);
			$('.price-old').text(response.price);
            $('.price-normal').text(response.price);
			$('.price-new').text(response.special);
			$('.price-tax span').text(response.ex_tax);
			$('.reward span').text(response.points);
            $('.total-units').text(`(${formattedTotalUnits} ${unitText})`);

		}
	});
}
