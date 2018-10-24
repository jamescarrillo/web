/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.DirectivoDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Directivo;
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
public class DirectivoDAOImpl implements DirectivoDAO {

    private static final Logger LOG = Logger.getLogger(DirectivoDAOImpl.class.getName());
    private final DataSource pool;

    public DirectivoDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Directivo> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00012 WHERE "
                    + "NOMBRES_APELLIDOS LIKE CONCAT('%',?,'%')");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                pst = conn.prepareStatement("SELECT * FROM WEB.F00012 WHERE "
                        + "NOMBRES_APELLIDOS LIKE CONCAT('%',?,'%') ORDER BY "
                        + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                pst.setString(1, String.valueOf(parameters.get("FILTER")));
                rs = pst.executeQuery();
                while (rs.next()) {
                    Directivo obj = new Directivo();
                    obj.setId(rs.getInt("ID"));
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
                    obj.setInstitucion(rs.getString("INSTITUCION"));
                    obj.setRegimen_laboral(rs.getString("REGIMEN_LABORAL"));
                    obj.setRetribucion_mensual(rs.getDouble("RETRIBUCION_MENSUAL"));
                    obj.setHoja_vida(rs.getString("HOJA_VIDA"));
                    obj.setEstado(rs.getBoolean("ESTADO"));
                    list.add(obj);
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
    public BEAN_CRUD add(Directivo obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.F00012(ID,TRATAMIENDO,NOMBRES_APELLIDOS,CARGO,NIVEL_REMUNERATIVO,"
                    + "NUMERO_DNI,RESOLUCION,FECHA_DESIGNACION,TELEFONO,FAX,E_MAIL,FOTO,PROFESION,RESUMEN,"
                    + "INSTITUCION,REGIMEN_LABORAL,RETRIBUCION_MENSUAL,HOJA_VIDA,ESTADO) "
                    + "VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00012),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            /*
            pst.setString(1, funcionario.getTratamiento());
            pst.setStr1ing(2, funcionario.getNombres_apellidos());
            pst.setString(3, funcionario.getCargo());
            pst.setString(4, funcionario.getNivel_remunerativo());
            pst.setString(5, funcionario.getNumero_dni());
            pst.setString(6, funcionario.getResolucion());
            pst.setDate(7, funcionario.getFecha_designacion());
            pst.setString(8, funcionario.getTelefono());
            pst.setString(9, funcionario.getFax());
            pst.setString(10, funcionario.getE_mail());
            pst.setString(11, funcionario.getFoto());
            pst.setString(12, funcionario.getProfesion());
            pst.setString(13, funcionario.getResumen());
            pst.setString(14, funcionario.getInstitucion());
            pst.setString(15, funcionario.getRegimen_laboral());
            pst.setDouble(16, funcionario.getRetribucion_mensual());
            pst.setString(17, funcionario.getHoja_vida());
            pst.setBoolean(18, funcionario.isEstado());
            pst.executeUpdate();
             */
            conn.commit();
            beancrud.setMESSAGE_SERVER("registered");
            beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public BEAN_CRUD update(Directivo obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.F00012 SET TRATAMIENDO = ?,NOMBRES_APELLIDOS = ?,CARGO = ?,NIVEL_REMUNERATIVO = ?,"
                    + "NUMERO_DNI = ?,RESOLUCION = ?,FECHA_DESIGNACION = ?,TELEFONO = ?,FAX = ?,E_MAIL = ?,FOTO = ?,PROFESION=?,RESUMEN=?,"
                    + "INSTITUCION = ?,REGIMEN_LABORAL =?,RETRIBUCION_MENSUAL = ?,HOJA_VIDA = ?,ESTADO =? WHERE ID = ?");
            pst.setString(1, obj.getTratamiento());
            pst.setString(2, obj.getNombres_apellidos());
            pst.setString(3, obj.getCargo());
            pst.setString(4, obj.getNivel_remunerativo());
            pst.setString(5, obj.getNumero_dni());
            pst.setString(6, obj.getResolucion());
            pst.setDate(7, obj.getFecha_designacion());
            pst.setString(8, obj.getTelefono());
            pst.setString(9, obj.getFax());
            pst.setString(10, obj.getE_mail());
            pst.setString(11, obj.getFoto());
            pst.setString(12, obj.getProfesion());
            pst.setString(13, obj.getResumen());
            pst.setString(14, obj.getInstitucion());
            pst.setString(15, obj.getRegimen_laboral());
            pst.setDouble(16, obj.getRetribucion_mensual());
            pst.setString(17, obj.getHoja_vida());
            pst.setBoolean(18, obj.getEstado());
            pst.setInt(19, obj.getId());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("modified");
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
            pst = conn.prepareStatement("DELETE FROM WEB.F00012 WHERE ID = ?");
            pst.setInt(1, (int) id);
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("deleted");
            beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public Directivo get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
