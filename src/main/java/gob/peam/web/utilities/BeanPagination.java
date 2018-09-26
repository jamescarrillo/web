/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.utilities;

import java.util.List;

/**
 *
 * @author James Carrillo
 */
public class BeanPagination {
    
    private int count_filter;
    private List list;

    public int getCount_filter() {
        return count_filter;
    }

    public void setCount_filter(int count_filter) {
        this.count_filter = count_filter;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

}
