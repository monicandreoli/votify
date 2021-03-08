const addField = () => {

  const field = document.getElementById("participators-field");

  const trigger = document.getElementById("municipality-needed");

  // const form = document.getElementById("new-idea-form");

  if (trigger) {
    trigger.addEventListener('input', (event) => {
      if (event.target.checked === true) {
        field.classList.add('participators-hide');       
      }
      else {
        field.classList.remove('participators-hide');
      }
    });
  }
}

export { addField };
