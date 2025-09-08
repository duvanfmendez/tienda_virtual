<?php
/**
 * DashboardModel (corregido)
 * Versión con validaciones para evitar warnings cuando las consultas devuelven NULL
 */
class DashboardModel extends Mysql
{
    public function __construct()
    {
        parent::__construct();
    }

		/**
	 * Obtiene la cantidad total de usuarios activos.
	 * @return int Número de usuarios
	 */
    // Cuenta usuarios activos
    public function cantUsuarios()
    {
        $sql = "SELECT COUNT(*) as total FROM persona WHERE status != 0";
        $request = $this->select($sql);
        $total = 0;
        if (!empty($request) && isset($request['total'])) {
            $total = intval($request['total']);
        }
        return $total;
    }

		/**
	 * Obtiene la cantidad total de clientes activos.
	 * @return int Número de clientes
	 */

    // Cuenta clientes activos (rol clientes)
    public function cantClientes()
    {
        $sql = "SELECT COUNT(*) as total FROM persona WHERE status != 0 AND rolid = " . intval(RCLIENTES);
        $request = $this->select($sql);
        $total = 0;
        if (!empty($request) && isset($request['total'])) {
            $total = intval($request['total']);
        }
        return $total;
    }

		/**
	 * Obtiene la cantidad total de productos activos.
	 * @return int Número de productos
	 */


    // Cuenta productos activos
    public function cantProductos()
    {
        $sql = "SELECT COUNT(*) as total FROM producto WHERE status != 0";
        $request = $this->select($sql);
        $total = 0;
        if (!empty($request) && isset($request['total'])) {
            $total = intval($request['total']);
        }
        return $total;
    }

		/**
	 * Obtiene la cantidad total de pedidos.
	 * Si el usuario logueado es cliente, filtra solo sus pedidos.
	 * @return int Número de pedidos
	 */


    // Cuenta pedidos (si es cliente, filtra por su id)
    public function cantPedidos()
    {
        $rolid = $_SESSION['userData']['idrol'] ?? null;
        $idUser = $_SESSION['userData']['idpersona'] ?? null;
        $where = "";
        if ($rolid == RCLIENTES && !empty($idUser)) {
            $where = " WHERE personaid = " . intval($idUser);
        }

        $sql = "SELECT COUNT(*) as total FROM pedido " . $where;
        $request = $this->select($sql);
        $total = 0;
        if (!empty($request) && isset($request['total'])) {
            $total = intval($request['total']);
        }
        return $total;
    }

		/**
	 * Obtiene los últimos 10 pedidos registrados.
	 * Si el usuario logueado es cliente, muestra solo sus pedidos.
	 * @return array Lista de pedidos recientes
	 */

    // 
    public function lastOrders()
    {
        $rolid = $_SESSION['userData']['idrol'] ?? null;
        $idUser = $_SESSION['userData']['idpersona'] ?? null;
        $where = "";
        if ($rolid == RCLIENTES && !empty($idUser)) {
            $where = " WHERE p.personaid = " . intval($idUser);
        }

        $sql = "SELECT p.idpedido, CONCAT(pr.nombres,' ',pr.apellidos) as nombre, p.monto, p.status 
                FROM pedido p
                INNER JOIN persona pr
                ON p.personaid = pr.idpersona
                " . $where . "
                ORDER BY p.idpedido DESC LIMIT 10";
        $request = $this->select_all($sql);
        if (empty($request)) {
            return [];
        }
        return $request;
    }

		/**
	 * Obtiene un resumen de pagos en un mes específico.
	 * Incluye tipo de pago, cantidad de transacciones y monto total.
	 * @param int $anio Año a consultar
	 * @param int $mes Mes a consultar
	 * @return array Datos de pagos del mes
	 */

    // Pagos por tipo en un mes
    public function selectPagosMes(int $anio, int $mes)
    {
        $anio = intval($anio);
        $mes = intval($mes);
        $sql = "SELECT p.tipopagoid, tp.tipopago, COUNT(p.tipopagoid) as cantidad, IFNULL(SUM(p.monto),0) as total 
                FROM pedido p 
                INNER JOIN tipopago tp 
                ON p.tipopagoid = tp.idtipopago 
                WHERE MONTH(p.fecha) = $mes AND YEAR(p.fecha) = $anio GROUP BY tipopagoid";
        $pagos = $this->select_all($sql);
        if (empty($pagos)) $pagos = [];
        $meses = Meses();
        $arrData = array('anio' => $anio, 'mes' => $meses[$mes - 1] ?? '', 'tipospago' => $pagos);
        return $arrData;
    }

		/**
	 * Obtiene las ventas de un mes, distribuidas por día.
	 * Filtra solo pedidos con estado "Completo".
	 * Si el usuario es cliente, solo muestra sus ventas.
	 * @param int $anio Año a consultar
	 * @param int $mes Mes a consultar
	 * @return array Ventas del mes (totales y por día)
	 */

    // Ventas por día en un mes
    public function selectVentasMes(int $anio, int $mes)
    {
        $anio = intval($anio);
        $mes = intval($mes);
        $rolid = $_SESSION['userData']['idrol'] ?? null;
        $idUser = $_SESSION['userData']['idpersona'] ?? null;
        $where = "";
        if ($rolid == RCLIENTES && !empty($idUser)) {
            $where = " AND personaid = " . intval($idUser);
        }

        $totalVentasMes = 0;
        $arrVentaDias = array();
        $dias = cal_days_in_month(CAL_GREGORIAN, $mes, $anio);

        for ($n_dia = 1; $n_dia <= $dias; $n_dia++) {
            $fechaVenta = sprintf("%04d-%02d-%02d", $anio, $mes, $n_dia);
            $sql = "SELECT DAY(fecha) AS dia, COUNT(idpedido) AS cantidad, IFNULL(SUM(monto),0) AS total 
                    FROM pedido 
                    WHERE DATE(fecha) = '$fechaVenta' AND status = 'Completo' " . $where;
            $ventaDia = $this->select($sql);

            if (empty($ventaDia) || !is_array($ventaDia)) {
                $ventaDia = ['dia' => $n_dia, 'cantidad' => 0, 'total' => 0];
            } else {
                $ventaDia['dia'] = $n_dia;
                $ventaDia['total'] = ($ventaDia['total'] === "" ? 0 : $ventaDia['total']);
            }

            $totalVentasMes += floatval($ventaDia['total']);
            $arrVentaDias[] = $ventaDia;
        }

        $meses = Meses();
        $arrData = array('anio' => $anio, 'mes' => $meses[$mes - 1] ?? '', 'total' => $totalVentasMes, 'ventas' => $arrVentaDias);
        return $arrData;
    }

		/**
	 * Obtiene las ventas de todo un año, distribuidas por mes.
	 * Solo incluye pedidos con estado "Completo".
	 * @param int $anio Año a consultar
	 * @return array Ventas anuales (por mes)
	 */

    // Ventas por mes en un año
    public function selectVentasAnio(int $anio)
    {
        $anio = intval($anio);
        $arrMVentas = array();
        $arrMeses = Meses();
        for ($i = 1; $i <= 12; $i++) {
            $sql = "SELECT $anio AS anio, $i AS mes, IFNULL(SUM(monto),0) AS venta 
                    FROM pedido 
                    WHERE MONTH(fecha)= $i AND YEAR(fecha) = $anio AND status = 'Completo' 
                    GROUP BY MONTH(fecha) ";
            $ventaMes = $this->select($sql);
            $arrData = ['anio' => $anio, 'no_mes' => $i, 'mes' => $arrMeses[$i - 1] ?? '', 'venta' => 0];
            if (!empty($ventaMes) && is_array($ventaMes)) {
                $arrData['anio'] = $ventaMes['anio'] ?? $anio;
                $arrData['no_mes'] = $ventaMes['mes'] ?? $i;
                $arrData['venta'] = $ventaMes['venta'] ?? 0;
            }
            $arrMVentas[] = $arrData;
        }
        $arrVentas = array('anio' => $anio, 'meses' => $arrMVentas);
        return $arrVentas;
    }

		/**
	 * Obtiene los últimos 10 productos activos registrados.
	 * @return array Lista de productos
	 */

    // Productos recientes (limitado)
    public function productosTen()
    {
        $sql = "SELECT * FROM producto WHERE status = 1 ORDER BY idproducto DESC LIMIT 1,10 ";
        $request = $this->select_all($sql);
        if (empty($request)) return [];
        return $request;
    }
}
?>
