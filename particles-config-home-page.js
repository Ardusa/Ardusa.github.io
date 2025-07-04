particlesJS('particles-js', {
  particles: {
    number: {
      value: 150,
      density: {
        enable: true,
        value_area: 800
      }
    },
    color: {
      value: '#ffffff'
    },
    shape: {
      type: 'circle',
      stroke: {
        width: 0,
        color: '#000000'
      },
      polygon: {
        nb_sides: 5
      },

    },
    opacity: {
      value: 0.5,
      random: false,
      anim: {
        enable: false,
        speed: 1,
        opacity_min: 0.1,
        sync: false
      }
    },
    size: {
      value: 3,
      random: true,
      anim: {
        enable: false,
        speed: 40,
        size_min: 0.1,
        sync: false
      }
    },
    line_linked: {
      enable: true,
      distance: 150,
      color: '#ffffff',
      opacity: 0.4,
      width: 1
    },
    move: {
      enable: true,
      speed: 2,
      direction: 'none',
      random: false,
      straight: false,
      out_mode: 'out',
      bounce: false,
      attract: {
        enable: false,
        rotateX: 600,
        rotateY: 1200
      }
    }
  },
  interactivity: {
    detect_on: 'window',
    events: {
      onhover: {
        enable: true,
        mode: ['grab']
      },
      onclick: {
        enable: false,
      },
      resize: true
    },
    modes: {
      grab: {
        distance: 400,
        line_linked: {
          opacity: 0.6
        }
      },
      bubble: {
        distance: 400,
        size: 20,
        duration: 2,
        opacity: 8,
        speed: 3
      },
      repulse: {
        distance: 200,
        duration: 0.4
      },
      push: {
        particles_nb: 4
      },
      remove: {
        particles_nb: 2
      },
      add: {
        particles_nb: 5
      }
    }
  },
  retina_detect: true
});

const particlesContainer = window.pJSDom[0].pJS;
let targetDivs = document.getElementsByClassName('title-container');
targetDivs = [...targetDivs, document.querySelector('footer')];

console.log(targetDivs);

targetDivs.forEach(div => {
  div.addEventListener('mouseenter', () => {
    particlesContainer.interactivity.events.onhover.enable = false;
  });
});

targetDivs.forEach(div => {
  div.addEventListener('mouseleave', () => {
    particlesContainer.interactivity.events.onhover.enable = true;
  });
});