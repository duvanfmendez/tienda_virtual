  document.querySelectorAll('[data-toggle="flip"]').forEach(el => {
    el.addEventListener('click', function (e) {
      e.preventDefault();

      // Ocultamos todos los formularios
      document.querySelector('.login-form').classList.add('d-none');
      document.querySelector('.forget-form').classList.add('d-none');
      document.querySelector('.register-form').classList.add('d-none');

      // Obtenemos el target (formulario que queremos mostrar)
      const target = this.getAttribute('data-target');

      // Mostramos el formulario indicado
      const formToShow = document.querySelector(`.${target}`);
      if (formToShow) {
        formToShow.classList.remove('d-none');
      }
    });
  });