    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fileXLS;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.swing.JTable;
import javax.swing.table.TableModel;
import org.apache.poi.hssf.usermodel.*;
import models.*;

public class MakeFileXLS {
    
    public void makeFile(int id, int stock_id) throws IOException, Exception
    {
        DBEntry[] params;
        if (stock_id == -1 && id != -1)
        {
            params = new DBEntry[1];
            params[0] = new DBEntry("resource_id", EntryType.Int, id);
        }
        else if (stock_id != -1 && id != -1)
        {
            params = new DBEntry[2];
            AvailableResource avRes = AvailableResource.getOne(id);
            params[0] = new DBEntry("resource_id", EntryType.Int, avRes.getResourceId());
            params[1] = new DBEntry("stock_id", EntryType.Int, stock_id);
        }
        else if (stock_id != -1 && id == -1)
        {
            params = new DBEntry[1];
            params[0] = new DBEntry("stock_id", EntryType.Int, stock_id);
        }
        else
        {
            params = null;
        }
        History[] history = History.getAll(params);
        String[] columnNames = {"Дата", "Ресурс", "Кол-во", "Склад"};
        Object[][] data = new Object[history.length][4];
        int len = Resource.getAll(null)[Resource.getAll(null).length - 1].getId();
        int[] total = new int[len];
        for (int i = 0; i < len;i++)
            total[i] = 0;
        for (int i = 0; i < history.length; i++)
        {
            data[i][0] = history[i].getDateString();
            Resource res = Resource.getOne(history[i].getResourceId());
            data[i][1] = res.getName();
            total[history[i].getResourceId() - 1] += history[i].getNumber();
            data[i][2] = total[history[i].getResourceId() - 1] + " " + res.getMeasureName();
            data[i][3] = "№" + history[i].getStockId();
        }
        JTable jtable = new JTable(data, columnNames);
        HSSFWorkbook table = new HSSFWorkbook();
        HSSFSheet fSheet = table.createSheet("Ресурсы");
        String link;
        //link = "/opt/tomcat/webapps/ROOT/"; //location on server
        if (stock_id == -1 && id != -1)
        {
            link = "/opt/tomcat/webapps/ROOT/resourceId" + id + ".xls"; //on server
            //link = "../../TUI2015/src/main/webapp/load/resourceId" + id + ".xls"; //on local
        }
        else if (stock_id != -1 && id != -1)
        {
            link = "/opt/tomcat/webapps/ROOT/resourceId" + id + "&stockId" + stock_id + ".xls"; //on server
            //link = "../../TUI2015/src/main/webapp/load/resourceId" + id + "&stockId" + stock_id + ".xls"; //on local
        }
        else if (stock_id != -1 && id == -1)
        {
            link = "/opt/tomcat/webapps/ROOT/stockId" + stock_id + ".xls"; //on server
            //link = "../../TUI2015/src/main/webapp/load/stockId" + stock_id + ".xls"; //on local
        }
        else
        {
            link = "/opt/tomcat/webapps/ROOT/history.xls"; //on server
            //link = "../../TUI2015/src/main/webapp/load/history.xls"; //on local
        }
        File file = new File(link);
        HSSFCellStyle cellStyle = table.createCellStyle();
        TableModel model = jtable.getModel();
        HSSFRow fRow = fSheet.createRow(0);
        for(int j = 0; j < model.getColumnCount(); j++) 
        {
            HSSFCell cell = fRow.createCell(j);
            cell.setCellValue(jtable.getColumnName(j));           
        }
        for (int i = 0; i < model.getRowCount(); i++) 
        {
            fRow = fSheet.createRow(i + 1);
            for (int j = 0; j < model.getColumnCount(); j++) 
            {
                HSSFCell cell = fRow.createCell(j);
                cell.setCellValue(model.getValueAt(i, j).toString());
                cell.setCellStyle(cellStyle);
            }
        }
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        BufferedOutputStream bos = new BufferedOutputStream(fileOutputStream);
        table.write(bos);
        bos.close();
        fileOutputStream.close();
    }
    
}
