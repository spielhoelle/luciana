//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require mdeditor
//= require jquery-ui/widgets/autocomplete
//= require popper
//= require bootstrap-sprockets
//= require autocomplete-rails
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
function drawRedText(editor) {

  $('#imageModal').modal('show')
  console.log(editor.codemirror)
  $(document).off("click", ".imagepicker")
  $(document).on("click", ".imagepicker", function(e) {
    var selectedText = editor.codemirror.getSelection();
    var text = e.currentTarget.src || 'placeholder';

    output = '!['+selectedText+'](' + text + ')';
    editor.codemirror.replaceSelection(output);
    //$('.image_source').val($(this).data('image-id'))
    //if ($('#media_library_target').length != 0) {
    //$('#media_library_target')[0].src = this.src
    //}
    $('#imageModal').modal('hide')

  })
  //$(document).on("click", ".image_remover", function(e) {
  //$('.image_source').val("")
  //if ($('#media_library_target').length != 0) {
  //$('#media_library_target')[0].src = ""
  //}
  //$('#imageModal').modal('hide')

  //})

  //var cm = editor.codemirror;
  //var output = '';
  //var selectedText = cm.getSelection();
  //var text = selectedText || 'placeholder';

  //output = '!!' + text + '!!';
  //cm.replaceSelection(output);

}
$(document).ready(function(){
  var simplemde = new SimpleMDE({ 
    element: document.getElementById("post_content"),
    //autofocus: true,
    //autosave: {
    //enabled: true,
    //uniqueId: "MyUniqueID",
    //delay: 1000,
    //},
    //blockStyles: {
    //bold: "__",
    //italic: "_"
    //},
    //element: document.getElementById("post_content"),
    //forceSync: true,
    //hideIcons: ["guide", "heading"],
    //indentWithTabs: false,
    //insertTexts: {
    //horizontalRule: ["", "\n\n-----\n\n"],
    //image: ["![](http://", ")"],
    //link: ["[", "](http://)"],
    //table: ["", "\n\n| Column 1 | Column 2 | Column 3 |\n| -------- | -------- | -------- |\n| Text     | Text      | Text     |\n\n"],
    //},
    //lineWrapping: false,
    //parsingConfig: {
    //allowAtxHeaderWithoutSpace: true,
    //strikethrough: false,
    //underscoresBreakWords: true,
    //},
    //placeholder: "Type here...",
    //previewRender: function(plainText) {
    //return customMarkdownParser(plainText); // Returns HTML from a custom parser
    //},
    //previewRender: function(plainText, preview) { // Async method
    //setTimeout(function(){
    //preview.innerHTML = customMarkdownParser(plainText);
    //}, 250);

    //return "Loading...";
    //},
    //promptURLs: true,
    //renderingConfig: {
    //singleLineBreaks: false,
    //codeSyntaxHighlighting: true,
    //},
    //shortcuts: {
    //drawTable: "Cmd-Alt-T"
    //},
    //showIcons: ["code", "table"],
    //spellChecker: false,
    //status: false,
    //status: ["autosave", "lines", "words", "cursor"], // Optional usage
    //status: ["autosave", "lines", "words", "cursor", {
    //className: "keystrokes",
    //defaultValue: function(el) {
    //this.keystrokes = 0;
    //el.innerHTML = "0 Keystrokes";
    //},
    //onUpdate: function(el) {
    //el.innerHTML = ++this.keystrokes + " Keystrokes";
    //}
    //}], // Another optional usage, with a custom status bar item that counts keystrokes
    //styleSelectedText: false,
    //tabSize: 4,
    toolbar: [
      "bold",
      "italic",
      "code",
      "quote",
      "unordered-list",
      "ordered-list",
      "clean-block",
      "link",
      "image",
      "horizontal-rule",
      "preview",
      "side-by-side",
      "fullscreen",
      "guide",
      {
        name: "redText",
        action: drawRedText,
        className: "fa fa-picture-o", // Look for a suitable icon
        title: "Media library (Ctrl/Cmd-Alt-R)",
      }
    ],
    //toolbarTips: false,


  });
  var simplemde = new SimpleMDE({ element: document.getElementById("photo_caption") });
})
