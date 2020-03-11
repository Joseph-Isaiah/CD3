const initCriticalButton = () => {
  const criticalButton = document.querySelector(".js-critical-button");
  if (!criticalButton) return;

  criticalButton.addEventListener("click", (event) => {
    const button = event.currentTarget;
    const form = button.closest("form");

    const conditionInputs = form.querySelectorAll("[name='call[condition_id]']")
    const hospitalInputs = form.querySelectorAll("[name='call[hospital_id]']")

    const pickedCondition = [...conditionInputs].find(input => input.checked)
    const pickedHospital = [...hospitalInputs].find(input => input.checked)

    if(!pickedHospital || !pickedCondition) {
      event.preventDefault();
      alert("You must select a hospital and condition")
      return false;
    }

    button.href = `${button.href}?hospital_id=${pickedHospital.value}&condition_id=${pickedCondition.value}`
  });
}

export { initCriticalButton };
