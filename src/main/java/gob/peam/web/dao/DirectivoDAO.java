/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao;

import gob.peam.web.model.Directivo;
import gob.peam.web.model.Directorio;
import gob.peam.web.utilities.BeanCrud;
import gob.peam.web.utilities.BeanPagination;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.sql.DataSource;

/**
 *
 * @author James Carrillo
 */
public class DirectivoDAO {

    private DataSource pool;

    private BeanPagination getPagination(HashMap<String, Object> parametros, Connection conn) throws SQLException {
        BeanPagination beanpagination = new BeanPagination();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.F000012 WHERE "
                    + String.valueOf(parametros.get("FIELD_FILTER")) + " LIKE CONCAT('%',?,'%')");
            pst.setString(1, String.valueOf(parametros.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCount_filter(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.F000012 WHERE "
                    + String.valueOf(parametros.get("FIELD_FILTER")) + " LIKE CONCAT('%',?,'%') ORDER BY "
                    + String.valueOf(parametros.get("SQL_ORDERS")) + " " + parametros.get("LIMIT"));
            pst.setString(1, String.valueOf(parametros.get("FILTER")));
            rs = pst.executeQuery();
            List list = new ArrayList<>();
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
            beanpagination.setList(list);
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beanpagination;
    }

    public BeanPagination getPagination(HashMap<String, Object> parametros) throws SQLException {
        BeanPagination beansPagination = null;
        try (Connection conn = pool.getConnection()) {
            beansPagination = getPagination(parametros, conn);
        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }

    public BeanCrud add(Directivo obj, HashMap<String, Object> parametros) throws SQLException {
        BeanCrud beancrud = new BeanCrud();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.F000012(ID,TRATAMIENDO,NOMBRES_APELLIDOS,CARGO,NIVEL_REMUNERATIVO,"
                    + "NUMERO_DNI,RESOLUCION,FECHA_DESIGNACION,TELEFONO,FAX,E_MAIL,FOTO,PROFESION,RESUMEN,"
                    + "INSTITUCION,REGIMEN_LABORAL,RETRIBUCION_MENSUAL,HOJA_VIDA,ESTADO) "
                    + "VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00012),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
            pst.setBoolean(18, obj.isEstado());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMessageServer("registered");
            beancrud.setBeanPagination(getPagination(parametros, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    public BeanCrud update(Directivo obj, HashMap<String, Object> parametros) throws SQLException {
        BeanCrud beancrud = new BeanCrud();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.F000012 SET TRATAMIENDO = ?,NOMBRES_APELLIDOS = ?,CARGO = ?,NIVEL_REMUNERATIVO = ?,"
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
            pst.setBoolean(18, obj.isEstado());
            pst.setInt(19, obj.getId());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMessageServer("modified");
            beancrud.setBeanPagination(getPagination(parametros, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    public BeanCrud delete(Directorio obj, HashMap<String, Object> parametros) throws SQLException {
        BeanCrud beancrud = new BeanCrud();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("DELETE FROM WEB.F000012 WHERE ID = ?");
            pst.setInt(1, obj.getId());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMessageServer("deleted");
            beancrud.setBeanPagination(getPagination(parametros, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

}
