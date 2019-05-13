/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.PersonalDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Personal;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;
import javax.sql.DataSource;

/**
 *
 * @author JamesCarrillo
 */
public class PersonalDAOImpl implements PersonalDAO {

    private static final Logger LOG = Logger.getLogger(PersonalDAOImpl.class.getName());

    private final DataSource pool;

    public PersonalDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Personal> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00010 WHERE "
                    + "LOWER(APELLIDOS_NOMBRES) LIKE CONCAT('%',?,'%') "
                    + parameters.get("SQL_ESTADO") + " "
                    + parameters.get("SQL_ANIO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.F00010 WHERE "
                            + "LOWER(APELLIDOS_NOMBRES) LIKE CONCAT('%',?,'%') "
                            + parameters.get("SQL_ESTADO") + " "
                            + parameters.get("SQL_ANIO") + " "
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Personal obj = new Personal();
                        obj.setId(rs.getInt("ID"));
                        obj.setAnho(rs.getString("ANHO"));
                        obj.setTrimestre(rs.getInt("TRIMESTRE"));
                        obj.setCargo(rs.getString("CARGO"));
                        obj.setPension(rs.getString("PENSION"));
                        obj.setFecha_ingreso(rs.getString("FECHA_INGRESO"));
                        obj.setFecha_cede(rs.getString("FECHA_CEDE"));
                        obj.setApellidos_nombres(rs.getString("APELLIDOS_NOMBRES"));
                        obj.setNumero_dni(rs.getString("NUMERO_DNI"));
                        obj.setCodigo_civil(rs.getString("CODIGO_CIVIL"));
                        obj.setOficina_area(rs.getString("OFICINA_AREA"));
                        obj.setRemuneracion_mensual(rs.getDouble("REMUNERACION_MENSUAL"));
                        obj.setBeneficios(rs.getDouble("BENEFICIOS"));
                        obj.setIngreso_total(rs.getDouble("INGRESO_TOTAL"));
                        obj.setTipo(rs.getInt("TIPO"));
                        obj.setCategoria(rs.getString("CATEGORIA"));
                        obj.setEstado(rs.getBoolean("ESTADO"));
                        obj.setObservacion(rs.getString("OBSERVACION"));
                        obj.setBonificacion_quinq(rs.getDouble("BONIFICACION_QUINQ"));
                        list.add(obj);
                    }
                }
            }
            beanpagination.setLIST(list);
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beanpagination;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters) throws SQLException {
        BEAN_PAGINATION beansPagination = null;
        try (Connection conn = pool.getConnection()) {
            beansPagination = getPagination(parameters, conn);
        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }

    @Override
    public BEAN_CRUD add(Personal obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.F00010(ID,ANHO,DENOMINACION,TRIMESTRE,CARGO,CODIGO_FORMATO,"
                    + "PENSION,FECHA_INGRESO,FECHA_CEDE,APELLIDOS_NOMBRES,NUMERO_DNI,CODIGO_CIVIL,OFICINA_AREA,REMUNERACION_MENSUAL,"
                    + "BENEFICIOS,INGRESO_TOTAL,TIPO,CATEGORIA,ESTADO,OBSERVACION,BONIFICACION_QUINQ) "
                    + "VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00010),"
                    + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getDenominacion());
            pst.setInt(3, obj.getTrimestre());
            pst.setString(4, obj.getCargo());
            pst.setString(5, obj.getCodigo_formato());
            pst.setString(6, obj.getPension());
            pst.setString(7, obj.getFecha_ingreso());
            pst.setString(8, obj.getFecha_cede());
            pst.setString(9, obj.getApellidos_nombres());
            pst.setString(10, obj.getNumero_dni());
            pst.setString(11, obj.getCodigo_civil());
            pst.setString(12, obj.getOficina_area());
            pst.setDouble(13, obj.getRemuneracion_mensual());
            pst.setDouble(14, obj.getBeneficios());
            pst.setDouble(15, obj.getIngreso_total());
            pst.setInt(16, obj.getTipo());
            pst.setString(17, obj.getCategoria());
            pst.setBoolean(18, obj.getEstado());
            pst.setString(19, obj.getObservacion());
            pst.setDouble(20, obj.getBonificacion_quinq());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("ok");
            beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public BEAN_CRUD update(Personal obj, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD delete(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("DELETE FROM WEB.F00010 WHERE ID = ?");
            pst.setInt(1, (int) id);
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("ok");
            beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public Personal get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Personal> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(DISTINCT(ANHO)) AS COUNT FROM WEB.F00010 WHERE "
                    + "LOWER(APELLIDOS_NOMBRES) LIKE CONCAT('%',?,'%') "
                    + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT DISTINCT(ANHO) FROM WEB.F00010 WHERE "
                            + "LOWER(APELLIDOS_NOMBRES) LIKE CONCAT('%',?,'%') "
                            + parameters.get("SQL_ESTADO") + " "
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Personal obj = new Personal();
                        obj.setAnho(rs.getString("ANHO"));
                        list.add(obj);
                    }
                }
            }
            beanpagination.setLIST(list);
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beanpagination;
    }

    @Override
    public BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters) throws SQLException {
        BEAN_PAGINATION beansPagination = null;
        try (Connection conn = pool.getConnection()) {
            beansPagination = getAnhos(parameters, conn);
        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }

    @Override
    public BEAN_PAGINATION getMes(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Personal> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(DISTINCT(TRIMESTRE)) AS COUNT FROM WEB.F00010 WHERE "
                    + "LOWER(APELLIDOS_NOMBRES) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT DISTINCT(TRIMESTRE) AS MES FROM WEB.F00010 WHERE "
                            + "LOWER(APELLIDOS_NOMBRES) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO")
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Personal orden = new Personal();
                        orden.setFecha_ingreso(rs.getString("MES"));
                        list.add(orden);
                    }
                }
            }
            beanpagination.setLIST(list);
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beanpagination;
    }

    @Override
    public BEAN_PAGINATION getMes(HashMap<String, Object> parameters) throws SQLException {
        BEAN_PAGINATION beansPagination = null;
        try (Connection conn = pool.getConnection()) {
            beansPagination = getMes(parameters, conn);
        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }

}
