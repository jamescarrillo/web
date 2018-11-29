/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.FuncionarioDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Funcionario;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.sql.DataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author JamesCarrillo
 */
public class FuncionarioDAOImpl implements FuncionarioDAO {

    private final Log logger = LogFactory.getLog(FuncionarioDAOImpl.class);
    private final DataSource pool;

    public FuncionarioDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Funcionario> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00013 WHERE "
                    + "LOWER(NOMBRES_APELLIDOS) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            this.logger.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.F00013 WHERE "
                            + "LOWER(NOMBRES_APELLIDOS) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO")
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    logger.info(pst);
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Funcionario obj = new Funcionario();
                        obj.setId(rs.getInt("ID"));
                        obj.setOrganigrama(rs.getString("ORGANIGRAMA"));
                        obj.setTratamiento(rs.getString("TRATAMIENTO"));
                        obj.setNombres_apellidos(rs.getString("NOMBRES_APELLIDOS"));
                        obj.setCargo(rs.getString("CARGO"));
                        obj.setNivel_remunerativo(rs.getString("NIVEL_REMUNERATIVO"));
                        obj.setNumero_dni(rs.getString("NUMERO_DNI"));
                        obj.setResolucion(rs.getString("RESOLUCION"));
                        obj.setFecha_designacion(rs.getDate("FECHA_DESIGNACION"));
                        obj.setTelefono(rs.getString("TELEFONO"));
                        obj.setFax(rs.getString("FAX"));
                        obj.setE_mail(rs.getString("E_MAIL"));
                        obj.setFoto(rs.getString("FOTO"));
                        obj.setProfesion(rs.getString("PROFESION"));
                        obj.setResumen(rs.getString("RESUMEN"));
                        obj.setRegimen_laboral(rs.getString("REGIMEN_LABORAL"));
                        obj.setRetribucion_mensual(rs.getDouble("RETRIBUCION_MENSUAL"));
                        obj.setHoja_vida(rs.getString("HOJA_VIDA"));
                        obj.setEstado(rs.getBoolean("ESTADO"));
                        obj.setDestacado(rs.getBoolean("DESTACADO"));
                        obj.setFecha_inicio(rs.getDate("FECHA_INICIO"));
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
    public BEAN_CRUD add(Funcionario obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.F00013(ID,NOMBRES_APELLIDOS,NUMERO_DNI,CARGO,ORGANIGRAMA,NIVEL_REMUNERATIVO,REGIMEN_LABORAL,"
                    + "RETRIBUCION_MENSUAL,RESOLUCION,FECHA_DESIGNACION,PROFESION,TELEFONO,FAX,E_MAIL,DESTACADO,FOTO,HOJA_VIDA,ESTADO) "
                    + "VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00013),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

            pst.setString(1, obj.getNombres_apellidos());
            pst.setString(2, obj.getNumero_dni());
            pst.setString(3, obj.getCargo());
            pst.setString(4, obj.getOrganigrama());
            pst.setString(5, obj.getNivel_remunerativo());
            pst.setString(6, obj.getRegimen_laboral());
            pst.setDouble(7, obj.getRetribucion_mensual());
            pst.setString(8, obj.getResolucion());
            pst.setDate(9, obj.getFecha_designacion());
            pst.setString(10, obj.getProfesion());
            pst.setString(11, obj.getTelefono());
            pst.setString(12, obj.getFax());
            pst.setString(13, obj.getE_mail());
            pst.setBoolean(14, obj.getDestacado());
            pst.setString(15, obj.getFoto());
            pst.setString(16, obj.getHoja_vida());
            pst.setBoolean(17, obj.getEstado());
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
    public BEAN_CRUD update(Funcionario obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.F00013 SET NOMBRES_APELLIDOS = ?,NUMERO_DNI = ?,CARGO = ?,ORGANIGRAMA = ?,NIVEL_REMUNERATIVO = ?,"
                    + "REGIMEN_LABORAL = ?,RETRIBUCION_MENSUAL = ?,RESOLUCION = ?,FECHA_DESIGNACION = ?,PROFESION = ?,TELEFONO = ?,FAX = ?, E_MAIL = ?,DESTACADO=?,FOTO = ?, HOJA_VIDA = ?, "
                    + "ESTADO = ? WHERE ID = ?");
            pst.setString(1, obj.getNombres_apellidos());
            pst.setString(2, obj.getNumero_dni());
            pst.setString(3, obj.getCargo());
            pst.setString(4, obj.getOrganigrama());
            pst.setString(5, obj.getNivel_remunerativo());
            pst.setString(6, obj.getRegimen_laboral());
            pst.setDouble(7, obj.getRetribucion_mensual());
            pst.setString(8, obj.getResolucion());
            pst.setDate(9, obj.getFecha_designacion());
            pst.setString(10, obj.getProfesion());
            pst.setString(11, obj.getTelefono());
            pst.setString(12, obj.getFax());
            pst.setString(13, obj.getE_mail());
            pst.setBoolean(14, obj.getDestacado());
            pst.setString(15, obj.getFoto());
            pst.setString(16, obj.getHoja_vida());
            pst.setBoolean(17, obj.getEstado());
            pst.setInt(18, obj.getId());
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
    public BEAN_CRUD delete(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("DELETE FROM WEB.F00013 WHERE ID = ?");
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
    public Funcionario get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.f00013 SET ESTADO = ? WHERE ID = ?");
            if (parameters.get("ESTADO").equals("true")) {
                pst.setBoolean(1, true);
            }else{
                pst.setBoolean(1, false);
            }
            pst.setInt(2, (int) id);
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

}
