/**
 * the pagination script for pagination tag
 * 
 * @author tonyho
 */
$(function() {
	var selector = $('.pagination').data('selector');

	// remove href attr to disable link
	$('.pagination a.disabled').removeAttr('href');

	$('.pagination a[href]').off('click').on('click', function(e) {
		e.preventDefault();

		var page = $(this).data('page');
		var $field = $(selector);
		// find parent form
		var $form = $field.parent();
		while ($form.size() > 0 && $form[0].tagName != 'FORM') {
			$form = $form.parent();
		}

		// disabled button to avoid submit button in IE 6
		$form.find('button[name]').prop('disabled', true);
		
		$field.val(page);
		$form.submit();
	});
});