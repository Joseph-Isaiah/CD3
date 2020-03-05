const radios = document.querySelector(".js-condition-radio-buttons").querySelectorAll("[type=radio]");

const handleRequestFields = (event) => {
  const id = event.currentTarget.value;
  const path = `/conditions/${id}/fields`

  Rails.ajax({
    url: path,
    type: "get",
    data: "",
    success: function(data) {},
    error: function(data) {}
  })
};

const initConditionRadioButtons = () => {
  radios.forEach((radio) => {
    radio.addEventListener("change", handleRequestFields)
  })
};

export { initConditionRadioButtons };
