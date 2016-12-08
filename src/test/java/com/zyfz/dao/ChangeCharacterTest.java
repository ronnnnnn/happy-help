package com.zyfz.dao;

import org.junit.Test;

import java.sql.*;

/**
 * Created by dengfengdecao on 16/12/8.
 */
public class ChangeCharacterTest {

    @Test
    public void testC() {
        //获取所有表
        Connection conn = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/happy_help?useUnicode=true&characterEncoding=utf8&autoReconnect=true&rewriteBatchedStatements=TRUE", "root", "root");

            ResultSet rs = conn.getMetaData().getTables(conn.getCatalog(), "root", null, new String[]{"TABLE"});
            while(rs.next()) {
                String tableName = rs.getString("TABLE_NAME");
                String sql = "ALTER TABLE "+tableName+" CONVERT TO CHARACTER SET `utf8mb4` COLLATE `utf8mb4_general_ci`";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.executeUpdate();
            }


        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        finally {
            if(conn!=null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
