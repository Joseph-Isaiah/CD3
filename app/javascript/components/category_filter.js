const initCategoryFilter = () => {
  const categoryFilter = document.querySelectorAll(".js-category-filter")
  const conditions = document.querySelectorAll(".js-category-filter-list [data-category]")

  categoryFilter.forEach((filter) => {
    filter.addEventListener("click", (event) => {
      event.preventDefault()

      conditions.forEach((condition) => {
        condition.style.display = "none"

        if(condition.dataset.category == filter.dataset.category) {
          condition.style.display = "block"
        }
      })
    })
  })
};

export { initCategoryFilter };
