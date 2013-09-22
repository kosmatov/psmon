/*jslint browser: true, forin: true */
(function($, window) {
  $(function() {

    $('button.destroy').on('click', function() {
      var _button = $(this);

      $.ajax({
        url: '/',
        method: 'delete',
        data: 'pid=' + _button.data('pid'),
        success: function() {
          _button.closest('tr').fadeOut(function() {
            $(this).remove();
          });
        },
        statusCode: {
          403: function() {
            _button.replaceWith('<span class="muted">Not permitted</span>');
          }
        }
      });
    });
  });
})(jQuery, window);

