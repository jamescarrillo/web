/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.model.others.Busqueda;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import javax.sql.DataSource;

/**
 *
 * @author JamesCarrillo
 */
public class BusquedaDAOImpl {

    private static final Logger LOG = Logger.getLogger(BusquedaDAOImpl.class.getName());
    private final DataSource pool;

    public BusquedaDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    public List<Busqueda> getBusqueda(String filter, Integer sizePage) throws SQLException {
        List<Busqueda> list = new ArrayList<>(sizePage);
        try (Connection conn = this.pool.getConnection()) {
            String query = "SELECT titulo_formato t, descripcion d, "
                    + " CASE WHEN titulo_formato='Misión' THEN '/web/institucion/vision-y-mision'"
                    + " WHEN titulo_formato='Visión' THEN '/web/institucion/vision-y-mision'"
                    + " WHEN titulo_formato='Ubicación' THEN '/web/institucion/ubicacion'"
                    + " WHEN titulo_formato='Estructura Orgánica (Organigrama)' THEN '/web/institucion/estructura-organica'"
                    + " WHEN titulo_formato='Directorio Telefónico' THEN '/web/institucion/directorios-de-contactos'"
                    + " ELSE '/web/institucion/objetivos-y-funciones'"
                    + " END  r from web.f00025 where ((concat(titulo_formato, ' ', descripcion) ILIKE CONCAT('%',?,'%')))"
                    + " UNION SELECT titulo t, substring(contenido from 1 for 301) d, concat('/web/publicaciones/noticias/notas-de-prensa?action=readNotaPrensa&idNota=',id)  r  from web.f00021 where ((concat(titulo) ILIKE CONCAT('%',?,'%')))"
                    + " UNION SELECT docu_titulo t, substring(docu_resumen from 1 for 301) d, concat('http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=',docu_id,'&anho=',trim(substring(docu_fecha_docx from 7)))  r  from web.documento where ((concat(docu_titulo) ILIKE CONCAT('%',?,'%')))";
            //ADD DELIMITADOR
            query += " LIMIT " + sizePage + " OFFSET 0";
            try (PreparedStatement pst = conn.prepareStatement(query)) {
                pst.setString(1, filter);
                pst.setString(2, filter);
                pst.setString(3, filter);
                LOG.info(pst.toString());
                try (ResultSet rs = pst.executeQuery()) {
                    while (rs.next()) {
                        Busqueda busqueda = new Busqueda();
                        busqueda.setT(rs.getString("T"));
                        busqueda.setD(rs.getString("D"));
                        busqueda.setR(rs.getString("R"));
                        list.add(busqueda);
                    }
                }
            }
        } catch (SQLException e) {
            throw e;
        }
        return list;
    }

}
