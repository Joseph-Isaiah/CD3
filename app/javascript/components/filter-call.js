const filterCall = (id) => {
  const callContainer = document.getElementById('call-info');
  const selectedCall = Array.from(callContainer.children).find((call) => {
    return call.id.replace('call-', '') === id.toString();
  })
  if (selectedCall) {
    Array.from(callContainer.children).forEach((call) => {
    call.style.display = 'none';
    })
    selectedCall.style.display = 'block';
  }
}

const handleCallClick = (event) => {
  const target = event.currentTarget
  const id = target.dataset.callId
  filterCall(id)
}

const initCallFiltering = () => {
  const callCards = document.querySelectorAll('.call-card');
  filterCall(callCards[0].dataset.callId);
  callCards.forEach(call => call.addEventListener('click', handleCallClick ))

  window.handleCallClick = handleCallClick;
  window.filterCall = filterCall;
}

export {initCallFiltering}
