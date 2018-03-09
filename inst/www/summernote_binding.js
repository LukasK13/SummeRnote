var summernoteBinding = new Shiny.InputBinding();
$.extend(summernoteBinding, {
  find: function(scope) {
    return $(scope).find('.summernoteInput');
  },
  initialize: function(el) {
    $(el).summernote(JSON.parse(el.dataset.options)).on('summernote.change', function(e) {
      $(el).trigger("change");
    });
  },
  getValue: function(el) {
    return $(el).summernote('code');
  },
  setValue: function(el, value) {
    $(el).summernote('code', value);
  },
  subscribe: function(el, callback) {
    $(el).on('change.summernoteBinding', function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off('.summernoteBinding');
  }
});

Shiny.inputBindings.register(summernoteBinding);

Shiny.addCustomMessageHandler("updateSummernoteInput", function(message) {
  $("#" + message.inputId).summernote("code", message.value); // Summernote-Input aktualisieren
});