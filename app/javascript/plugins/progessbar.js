import ProgressBar from 'progressbar.js'

const progressBar = () => {
    window.onload = function onLoad() {
        var circle = new ProgressBar.Circle('#progress', {
            color: '#FCB03C',
            duration: 3000,
            easing: 'easeInOut'
        });

        circle.animate(1);
    };
}

export { progressBar }