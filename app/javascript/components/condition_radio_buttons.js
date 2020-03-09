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
  const radios = document.querySelectorAll(".js-condition-radio-buttons [type=radio]");
  radios.forEach((radio) => {
    radio.addEventListener("change", handleRequestFields)
  })
};

export { initConditionRadioButtons };
