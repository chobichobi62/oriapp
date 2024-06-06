document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll('.like-button').forEach(button => {
    button.addEventListener('click', () => {
      const recipeId = button.dataset.recipeId;
      const liked = button.dataset.liked === "true";
      const url = `/recipes/${recipeId}/favorite`;

      fetch(url, {
        method: liked ? 'DELETE' : 'POST',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
      }).then(response => response.json()).then(data => {
        if (data.success) {
          button.dataset.liked = liked ? "false" : "true";
          button.querySelector('.heart').classList.toggle('liked', !liked);
          button.querySelector('.like-count').textContent = data.favorites_count;
        }
      });
    });
  });
});
