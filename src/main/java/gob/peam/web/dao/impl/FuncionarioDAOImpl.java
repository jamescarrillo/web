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
            pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.F00013 WHERE "
                    + "LOWER(NOMBRES_APELLIDOS) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            this.logger.info("[1] " + pst);
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
                if (rs.getInt("CANT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.F00013 WHERE "
                            + "LOWER(NOMBRES_APELLIDOS) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO")
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    this.logger.info("[2] " + pst);
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
            pst = conn.prepareStatement("INSERT INTO WEB.F00013(ID,ORGANIGRAMA,TRATAMIENDO,NOMBRES_APELLIDOS,CARGO,NIVEL_REMUNERATIVO,"
                    + "NUMERO_DNI,RESOLUCION,FECHA_DESIGNACION,TELEFONO,FAX,E_MAIL,FOTO,PROFESION,RESUMEN,"
                    + "REGIMEN_LABORAL,RETRIBUCION_MENSUAL,HOJA_VIDA,ESTADO) "
                    + "VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00013),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, obj.getOrganigrama());
            pst.setString(2, obj.getTratamiento());
            pst.setString(3, obj.getNombres_apellidos());
            pst.setString(4, obj.getCargo());
            pst.setString(5, obj.getNivel_remunerativo());
            pst.setString(6, obj.getNumero_dni());
            pst.setString(7, obj.getResolucion());
            pst.setDate(8, obj.getFecha_designacion());
            pst.setString(9, obj.getTelefono());
            pst.setString(10, obj.getFax());
            pst.setString(11, obj.getE_mail());
            pst.setString(12, obj.getFoto());
            pst.setString(13, obj.getProfesion());
            pst.setString(14, obj.getResumen());
            pst.setString(15, obj.getRegimen_laboral());
            pst.setDouble(16, obj.getRetribucion_mensual());
            pst.setString(17, obj.getHoja_vida());
            pst.setBoolean(18, obj.getEstado());
            pst.setBoolean(19, obj.getDestacado());
            pst.setDate(20, obj.getFecha_inicio());
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
            pst = conn.prepareStatement("UPDATE WEB.F00013 SET ORGANIGRAMA = ?,TRATAMIENDO = ?,NOMBRES_APELLIDOS = ?,CARGO = ?,NIVEL_REMUNERATIVO = ?,"
                    + "NUMERO_DNI = ?,RESOLUCION = ?,FECHA_DESIGNACION = ?,TELEFONO = ?,FAX = ?, E_MAIL = ?,FOTO = ?,PROFESION = ?, RESUMEN = ?,"
                    + "REGIMEN_LABORAL = ?,RETRIBUCION_MENSUAL = ?,HOJA_VIDA = ?, ESTADO = ? WHERE ID = ?");
            pst.setString(1, obj.getOrganigrama());
            pst.setString(2, obj.getTratamiento());
            pst.setString(3, obj.getNombres_apellidos());
            pst.setString(4, obj.getCargo());
            pst.setString(5, obj.getNivel_remunerativo());
            pst.setString(6, obj.getNumero_dni());
            pst.setString(7, obj.getResolucion());
            pst.setDate(8, obj.getFecha_designacion());
            pst.setString(9, obj.getTelefono());
            pst.setString(10, obj.getFax());
            pst.setString(11, obj.getE_mail());
            pst.setString(12, obj.getFoto());
            pst.setString(13, obj.getProfesion());
            pst.setString(14, obj.getResumen());
            pst.setString(15, obj.getRegimen_laboral());
            pst.setDouble(16, obj.getRetribucion_mensual());
            pst.setString(17, obj.getHoja_vida());
            pst.setBoolean(18, obj.getEstado());
            pst.setBoolean(19, obj.getDestacado());
            pst.setDate(20, obj.getFecha_inicio());
            pst.setInt(21, obj.getId());
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

}