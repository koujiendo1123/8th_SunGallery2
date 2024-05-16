// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// WEBバックにも追記しているが念の為追記
// import "@hotwired/turbo-rails"
function printImages() {
  var content = document.getElementById('printable-images').innerHTML;
  var originalContent = document.body.innerHTML;

  document.body.innerHTML = content;
  window.print();
  document.body.innerHTML = originalContent;
}
