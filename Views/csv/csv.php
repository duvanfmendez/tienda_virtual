<?php headerAdmin($data); ?>
<main class="app-content">
  <div class="app-title">
    <h1><i class="fa fa-upload"></i> Carga Masiva CSV</h1>
  </div>

  <div class="row mb-4">
    <div class="col-md-5">
      <form action="<?= base_url(); ?>/csv/subirCSV" method="POST" enctype="multipart/form-data">
        <div class="form-group">
          <label for="file">Archivo CSV</label>
          <input type="file" name="dataCliente" class="form-control" accept=".csv" required>
        </div>
        <button type="submit" class="btn btn-primary">Subir CSV</button>
      </form>
    </div>

    <div class="col-md-7">
      <h5>Total Registros: <?= count($data['personas']) ?></h5>
      <table id="tablaUsuarios" class="table table-bordered table-hover table-striped">
        <thead class="thead-dark text-center">
          <tr>
            <th>ID</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Email</th>
            <th>Teléfono</th>
            <th>Rol</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($data['personas'] as $row): ?>
            <tr class="text-center">
              <td><?= $row['idpersona'] ?></td>
              <td><?= $row['nombres'] ?></td>
              <td><?= $row['apellidos'] ?></td>
              <td><?= $row['email_user'] ?></td>
              <td><?= $row['telefono'] ?></td>
              <td>
                <?php
                  switch ($row['rolid']) {
                    case 1: echo "Administrador"; break;
                    case 2: echo "Supervisor"; break;
                    case 3: echo "Cliente"; break;
                    default: echo "Sin Rol"; break;
                  }
                ?>
              </td>
              <td>
                <?= $row['status'] == 1
                      ? '<span class="badge badge-success">Activo</span>'
                      : '<span class="badge badge-danger">Inactivo</span>' ?>
              </td>
            </tr>
          <?php endforeach ?>
        </tbody>
      </table>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>
