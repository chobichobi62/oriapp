document.addEventListener("DOMContentLoaded", function() {
  const favoriteButton = document.getElementById("favoriteButton");
  const heartIcon = document.getElementById("heartIcon");

  if (favoriteButton && heartIcon) {
    favoriteButton.addEventListener("click", function() {
      const recipeId = favoriteButton.dataset.recipeId;
      const isFavorited = favoriteButton.classList.contains("active");

      fetch(`/favorites/toggle`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ recipe_id: recipeId })
      })
      .then(response => response.json())
      .then(data => {
        if (data.status === 'added') {
          favoriteButton.classList.add("active");
          heartIcon.classList.remove("bi-heart");
          heartIcon.classList.add("bi-heart-fill", "pink-heart");
          favoriteButton.querySelector('span').innerText = 'お気に入り解除';
        } else if (data.status === 'removed') {
          favoriteButton.classList.remove("active");
          heartIcon.classList.remove("bi-heart-fill", "pink-heart");
          heartIcon.classList.add("bi-heart");
          favoriteButton.querySelector('span').innerText = 'お気に入り登録';
        }
      })
      .catch(error => {
        console.error("Error:", error);
      });
    });
  } else {
    console.error("Favorite button or heart icon not found!");
  }
});
