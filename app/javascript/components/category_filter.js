const initCategoryFilter = () => {
  const categoryFilterList = document.querySelector(".js-category-filter-list")
  const categoryFilter = document.querySelectorAll(".js-category-filter")
  const conditions = document.querySelectorAll(".js-category-filter-list [data-category]")

  categoryFilter.forEach((filter) => {
    filter.addEventListener("click", (event) => {
      event.preventDefault()

      conditions.forEach((condition) => {
        const label = condition.closest("label")
        label.style.display = "none"

        if(condition.dataset.category == filter.dataset.category) {
          label.style.display = "block"
        }
        categoryFilterList.style.display = "grid"
      })
    })
  })
};

export { initCategoryFilter };
