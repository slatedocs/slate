function copyToClipboard(container) {
  const text = container.textContent.replace(/\n$/, '');
  
  // Use the Clipboard API
  navigator.clipboard.writeText(text)
    .then(() => {
    // Add success feedback
      const button = container.parentNode.querySelector('.copy-clipboard');
      const originalHTML = button.innerHTML;
      
      // Show success state
      button.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>Copied!</title><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z"></path></svg>';
      
      // Reset after 1 second
      setTimeout(() => {
        button.innerHTML = originalHTML;
      }, 1000);
    })
    .catch(err => {
      console.error('Failed to copy: ', err);
    });
}

function setupCodeCopy() {
  $('pre.highlight').prepend('<div class="copy-clipboard"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>Copy to Clipboard</title><path d="M18 6v-6h-18v18h6v6h18v-18h-6zm-12 10h-4v-14h14v4h-10v10zm16 6h-14v-14h14v14z"></path></svg></div>');
  $('.copy-clipboard').on('click', function() {
    copyToClipboard(this.parentNode.children[1]);
  });
}
