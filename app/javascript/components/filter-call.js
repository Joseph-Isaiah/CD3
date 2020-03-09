const filterCall = (id) => {
  const callContainer = document.getElementById('call-info');
  const selectedCall = Array.from(callContainer.children).find((call) => {
    return call.id.replace('call-', '') === id;
  })
  if (selectedCall) {
    Array.from(callContainer.children).forEach((call) => {
    call.style.display = 'none';
    })
    selectedCall.style.display = 'block';
  }
}

const handleClick = (event) => {
  const target = event.currentTarget
  const id = target.dataset.callId
  filterCall(id)
}

const initCallFiltering = () => {
  const callCards = document.querySelectorAll('.call-card');
  filterCall(callCards[0].dataset.callId);
  callCards.forEach(call => call.addEventListener('click', handleClick ))
}

export {initCallFiltering}
