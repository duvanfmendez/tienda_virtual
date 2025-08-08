document.addEventListener('DOMContentLoaded', function () {
  const formRegister = document.querySelector('#formRegister');
  const divLoading = document.querySelector('#divLoading');

  if (formRegister) {
    formRegister.onsubmit = function (e) {
      e.preventDefault();

      let identificacion = document.querySelector('#txtIdentificacion').value.trim();
      let nombre = document.querySelector('#txtNombre').value.trim();
      let apellido = document.querySelector('#txtApellido').value.trim();
      let telefono = document.querySelector('#txtTelefono').value.trim();
      let email = document.querySelector('#txtEmailCliente').value.trim();
      let password = document.querySelector('#txtPasswordCliente').value.trim();

      if (identificacion === '' || nombre === '' || apellido === '' || telefono === '' || email === '' || password === '') {
        swal('Atención', 'Todos los campos son obligatorios.', 'error');
        return false;
      }

      let emailRegex = /^\S+@\S+\.\S+$/;
      if (!emailRegex.test(email)) {
        swal('Atención', 'Ingrese un correo electrónico válido.', 'error');
        return false;
      }

      let phoneRegex = /^[0-9]{7,15}$/;
      if (!phoneRegex.test(telefono)) {
        swal('Atención', 'Ingrese un número de teléfono válido (7 a 15 dígitos).', 'error');
        return false;
      }

      divLoading.style.display = 'flex';

      let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
      let ajaxUrl = base_url + '/Login/registroCliente';

      let formData = new FormData();
      formData.append('txtIdentificacion', identificacion);
      formData.append('txtNombre', nombre);
      formData.append('txtApellido', apellido);
      formData.append('txtTelefono', telefono);
      formData.append('txtEmail', email);
      formData.append('txtPassword', password);

      request.open('POST', ajaxUrl, true);
      request.send(formData);

      request.onreadystatechange = function () {
        if (request.readyState === 4 && request.status === 200) {
          let objData = JSON.parse(request.responseText);
          if (objData.status) {
            swal('Registro exitoso', objData.msg, 'success');
            formRegister.reset();
            document.querySelector('[data-toggle="flip"][data-target="login-form"]').click();
          } else {
            swal('Error', objData.msg, 'error');
          }
          divLoading.style.display = 'none';
        }
      }
    }
  }
});