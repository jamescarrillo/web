/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.utilities;

/**
 *
 * @author James Carrillo
 */
public class BeanCrud {

    private String messageServer;
    private BeanPagination beanPagination;

    public BeanCrud() {
    }

    public BeanCrud(BeanPagination beanPagination) {
        this.beanPagination = beanPagination;
    }

    public BeanCrud(String messageServer, BeanPagination beanPagination) {
        this.messageServer = messageServer;
        this.beanPagination = beanPagination;
    }

    public String getMessageServer() {
        return messageServer;
    }

    public void setMessageServer(String messageServer) {
        this.messageServer = messageServer;
    }

    public BeanPagination getBeanPagination() {
        return beanPagination;
    }

    public void setBeanPagination(BeanPagination beanPagination) {
        this.beanPagination = beanPagination;
    }

}
