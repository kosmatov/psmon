/*jslint browser: true, forin: true */
(function($, window) {
  $(function() {

    $('button.destroy').on('click', function() {
      var _button = $(this);
  console.log(_button)
      $.ajax({
        url: '/',
        method: 'delete',
        data: 'pid=' + _button.data('pid'),
        success: function() {
          _button.closest('tr').fadeOut(function() {
            $(this).remove();
          });
        } 
      });
    });
  });
})(jQuery, window);

