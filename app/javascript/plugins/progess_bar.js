import ProgressBar from 'progressbar.js'

const circleProgress = () => {
  document.querySelectorAll(".progress-container").forEach((container) => {

    var bar = new ProgressBar.Circle(container, {
      color: '#C7C9C7',
      // This has to be the same size as the maximum width to
      // prevent clipping
      strokeWidth: 4,
      trailWidth: 1,
      easing: 'easeInOut',
      duration: 1400,
      text: {
        autoStyleContainer: false
      },
      from: { color: '#FF5C00', width: 1 },
      to: { color: '#FF5C00', width: 4 },
      // Set default step function for all animate calls
      step: function(state, circle) {
        circle.path.setAttribute('stroke', state.color);
        circle.path.setAttribute('stroke-width', state.width);

        var value = Math.round(circle.value() * container.dataset.total);
        let centerText = "".concat(value, "/", container.dataset.total);
        if (value === 0) {
          circle.setText('');
        } else {
          circle.setText('');
        }

      }
    });
    bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
    bar.text.style.fontSize = '1rem';

    bar.animate(container.dataset.vote / container.dataset.total);
    // Number from 0.0 to 1.0
  });
}

export { circleProgress }
