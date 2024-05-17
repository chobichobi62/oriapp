document.addEventListener("DOMContentLoaded", function() {
  const favoriteButton = document.getElementById("favoriteButton");
  const heartIcon = document.getElementById("heartIcon");

  if (favoriteButton && heartIcon) {
    favoriteButton.addEventListener("click", function() {
      if (favoriteButton.classList.contains("active")) {
        favoriteButton.classList.remove("active");
        heartIcon.classList.remove("bi-heart-fill");
        heartIcon.classList.add("bi-heart");
        // お気に入りを取り下げたときの処理
      } else {
        favoriteButton.classList.add("active");
        heartIcon.classList.remove("bi-heart");
        heartIcon.classList.add("bi-heart-fill");
        // お気に入りを押したときの処理
      }
    });
  } else {
    console.error("Favorite button or heart icon not found!");
  }
});
