document.addEventListener('DOMContentLoaded', function() {
  var toggleEditor = document.getElementById('toggle-editor');
  var textAreaContainer = document.getElementById('text-area-container');
  var editorContainer = document.getElementById('editor-container');
  var introtext = document.getElementById('introtext');
  var editor = tinymce.get('editor');
  var isEditorActive = true;

  toggleEditor.addEventListener('click', function() {
    if (isEditorActive) {
      $('#editor-container').hide();
      $('#text-area-container').show();
      introtext.value = tinymce.get('editor').getContent();
      isEditorActive = false;
    } else {
      $('#text-area-container').hide();
      $('#editor-container').show();
      introtext.value = tinymce.get('editor').getContent();
      isEditorActive = true;
    }
  });

  tinymce.init({
    selector: 'textarea#editor',
    height: 300,
    setup: function (editor) {
      editor.on('change', function () {
        introtext.value = editor.getContent();
      });
    }
  });
});