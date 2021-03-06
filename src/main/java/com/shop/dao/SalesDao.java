package com.shop.dao;

import com.shop.domain.Sales;
import com.shop.utils.DBUtil;

import java.sql.ResultSet;
import java.util.ArrayList;

public class SalesDao extends DBUtil {

    /**
     * 插入一个sales对象
     *
     * @param sales 订单表
     * @return
     */
    public boolean insert(Sales sales) {
       //sql语句
        String sql = "insert into sales(cid,pid,count,totalPrice,orderDate,invoiceNo,orderStatus) values(?,?,?,?,?,?,?)";
        //sql参数
        Object[] params = {
                sales.getcId(),
                sales.getpId(),
                sales.getCount(),
                sales.getTotalPrice(),
                sales.getOrderDate(),
                sales.getInvoiceNo(),
                sales.getOrderStatus(),
        };
        try {
            int n = this.doUpdate(sql, params);
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close();
        }
        return false;
    }

    /**
     * 按照ID删除订单
     *
     * @param id 订单ID
     * @return
     */
    public boolean delete(int id) {
        String sql = "delete from sales where id="+id;
        try {
            int n = this.doUpdate(sql);
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close();
        }
        return false;
    }

    /**
     * 修改订单
     *
     * @param sales 
     * @return
     */
    public boolean update(Sales sales) {
        String sql = "update  set cId=?,pId=?,count=?,totalPrice=?,orderDate=?,invoiceNo=?,orderStatus=?,delivDate where id=?";
        Object[] params = {
                sales.getcId(),
                sales.getpId(),
                sales.getCount(),
                sales.getTotalPrice(),
                sales.getOrderDate(),
                sales.getInvoiceNo(),
                sales.getOrderStatus(),
                sales.getDelivDate(),
                sales.getId()
        };
        try {
            int n = this.doUpdate(sql, params);
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close();
        }
        return false;
    }

    /**
     * 按照Name查找订单
     *
     * @param id 订单ID 
     * @return
     */
    public Sales find(int id) {
        String sql = "select * from sales where id = "+id;
        try {
            this.rs = this.doQuery(sql);
            if (rs.next()) {
                return getSales(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close();
        }
        return null;
    }
    /**
     * 按照cip,pid查找订单
     *
     * @param
     * @return
     */
    public Sales find(int cid,int pid) {
        String sql = "select * from sales where id = ? and pid =?";
        Object[] params = {cid,pid};
        try {
            this.rs = this.doQuery(sql);
            if (rs.next()) {
                return getSales(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close();
        }
        return null;
    }
    /**
     * 查找某用户id的所有购物车
     *
     * @return
     */
    public ArrayList<Sales> findAll(int cid) {
        String sql = "select * from sales where cId = ? order by id";
        ArrayList<Sales> list = new ArrayList<Sales>();
        Object[] params = {cid};
        try {
            this.rs = this.doQuery(sql, params);
            while (rs.next()) {
                list.add( getSales(rs));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close();
        }
        return null;
    }
    /**
     * 查找某用户id的所有购物车
     *
     * @return
     */
    public ArrayList<Sales> findAll() {
        String sql = "select * from sales order by id";
        ArrayList<Sales> list = new ArrayList<Sales>();
        try {
            this.rs = this.doQuery(sql);
            while (rs.next()) {
                Sales sales = new Sales();
                sales.setId(rs.getInt(1));
                sales.setcId(rs.getInt(2));
                sales.setpId(rs.getInt(3));
                sales.setCount(rs.getInt(4));
                sales.setTotalPrice(rs.getInt(5));
                sales.setOrderDate(rs.getTimestamp(6));
                sales.setInvoiceNo(rs.getString(7));
                sales.setOrderStatus(rs.getString(8));
                sales.setDelivDate(rs.getTimestamp(9));
                list.add( getSales(rs));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close();
        }
        return null;
    }
    /**
     * 查找用户所有订单
     *
     * @return
     */
    public ArrayList<Sales> findShow(int cid) {
        String sql = "select cId,pId,count,totalPrice,orderDate,invoiceNo,orderStatus,delivDate from sales where cid = ? order by id";
        ArrayList<Sales> list = new ArrayList<Sales>();
        Object[] params = {cid};
        try {
            this.rs = this.doQuery(sql, params);
            while (rs.next()) {
                Sales sales = new Sales();
                sales.setId(cid);
                sales.setcId(rs.getInt(1));
                sales.setpId(rs.getInt(2));
                sales.setCount(rs.getInt(3));
                sales.setTotalPrice(rs.getInt(4));
                sales.setOrderDate(rs.getTimestamp(5));
                sales.setInvoiceNo(rs.getString(6));
                sales.setOrderStatus(rs.getString(7));
                sales.setDelivDate(rs.getTimestamp(8));
                list.add( getSales(rs));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close();
        }
        return null;
    }

    /**
     * 从返回结果集中获取订单
     * @param rs
     * @return
     */
    public Sales getSales(ResultSet rs) {
        try{
            if(rs != null) {
                Sales sales = new Sales();
                sales.setcId(rs.getInt(1));
                sales.setpId(rs.getInt(2));
                sales.setCount(rs.getInt(3));
                sales.setTotalPrice(rs.getInt(4));
                sales.setOrderDate(rs.getTimestamp(5));
                sales.setInvoiceNo(rs.getString(6));
                sales.setOrderStatus(rs.getString(7));
                sales.setDelivDate(rs.getTimestamp(8));
                return sales;
            }else{
                return null;
            }
        }catch(Exception e ) {
            e.printStackTrace();
        }
        return null;
    }
}
