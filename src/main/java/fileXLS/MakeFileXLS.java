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
import java.util.Vector;
import javax.swing.JTable;
import javax.swing.table.TableModel;
import org.apache.poi.hssf.usermodel.*;
import models.*;

public class MakeFileXLS {
    
    private String link = "/opt/tomcat/webapps/ROOT/"; //on server
    //private String link = "../../TUI2015/src/main/webapp/load/"; //on local (Please create a table "load" in TUI2015/src/main/webapp/)
    
    public void resources(int id, int stock_id) throws IOException, Exception
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
        String[] columnNames = {"Дата, гггг-мм-дд", "Ресурс", "Кол-во", "Изменение", "Склад"};
        Object[][] data = new Object[history.length][5];
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
            if (history[i].getNumber() > 0)
                data[i][3] = "+" + history[i].getNumber() + " " + res.getMeasureName();
            else
                data[i][3] = history[i].getNumber() + " " + res.getMeasureName();
            data[i][4] = "№" + history[i].getStockId();
        }
        JTable jtable = new JTable(data, columnNames);
        HSSFWorkbook table = new HSSFWorkbook();
        HSSFSheet fSheet = table.createSheet("Ресурсы");
        if (stock_id == -1 && id != -1)
            link += "resourceId" + id + ".xls";
        else if (stock_id != -1 && id != -1)
            link += "resourceId" + id + "&stockId" + stock_id + ".xls";
        else if (stock_id != -1 && id == -1)
            link += "stockId" + stock_id + ".xls";
        else
            link += "history.xls";
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
    
    public void applications(int status) throws Exception
    {
        DBEntry[] params = {
            new DBEntry("request_type_id", EntryType.Int, 1),
            new DBEntry("status", EntryType.Int, status)
        };
        DBEntry[] params1 = {
            new DBEntry("request_type_id", EntryType.Int, 2),
            new DBEntry("status", EntryType.Int, status)
        };
        Request[] req = Request.getAll(params);
        Request[] req1 = Request.getAll(params1);
        Vector <Integer> ind = new Vector();
        Vector <Integer> numb = new Vector();
        for (int i = 0; i < req.length; i++)
        {
            if (ind.size() > 0)
            {
                boolean f = false;
                for (int j = 0; j < ind.size(); j++)
                    if (ind.elementAt(j) == req[i].getResourceId())
                    {
                        numb.set(j, numb.elementAt(j) + req[i].getNumber());
                        f = true;
                    }
                if (!f)
                {
                    numb.add(req[i].getNumber());
                    ind.add(req[i].getResourceId());
                }
            }
            else
            {
                numb.add(req[i].getNumber());
                ind.add(req[i].getResourceId());
            }
        }
        Vector <Integer> ind1 = new Vector();
        Vector <Integer> numb1 = new Vector();
        for (int i = 0; i < req1.length; i++)
        {
            if (ind1.size() > 0)
            {
                boolean f = false;
                for (int j = 0; j < ind1.size(); j++)
                    if (ind1.elementAt(j) == req1[i].getResourceId())
                    {
                        numb1.set(j, numb1.elementAt(j) + req1[i].getNumber());
                        f = true;
                    }
                if (!f)
                {
                    numb1.add(req1[i].getNumber());
                    ind1.add(req1[i].getResourceId());
                }
            }
            else
            {
                numb1.add(req1[i].getNumber());
                ind1.add(req1[i].getResourceId());
            }
        }
        String[] columnNames = {"Ресурс", "Кол-во"};
        Object[][] data = new Object[numb.size()][2];
        Object[][] data1 = new Object[numb1.size()][2];
        for (int i = 0; i < numb.size(); i++)
        {
            data[i][0] = Resource.getOne(ind.elementAt(i)).getName();
            data[i][1] = numb.elementAt(i) + " " + Resource.getOne(ind.elementAt(i)).getMeasureName();
        }
        for (int i = 0; i < numb1.size(); i++)
        {
            data1[i][0] = Resource.getOne(ind1.elementAt(i)).getName();
            data1[i][1] = numb1.elementAt(i) + " " + Resource.getOne(ind1.elementAt(i)).getMeasureName();
        }
        JTable jtable = new JTable(data, columnNames);
        JTable jtable1 = new JTable(data1, columnNames);
        HSSFWorkbook table = new HSSFWorkbook();
        HSSFSheet fSheet = table.createSheet("Нуждающиеся ресурсы");
        HSSFSheet fSheet1 = table.createSheet("Пожертвованные ресурсы");
        if (status == 0)
            link += "resources_ready.xls";
        else
            link += "resources_done.xls";
        File file = new File(link);
        HSSFCellStyle cellStyle = table.createCellStyle();
        TableModel model = jtable.getModel();
        TableModel model1 = jtable1.getModel();
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
        HSSFRow fRow1 = fSheet1.createRow(0);
        for(int j = 0; j < model1.getColumnCount(); j++) 
        {
            HSSFCell cell = fRow1.createCell(j);
            cell.setCellValue(jtable1.getColumnName(j));           
        }
        for (int i = 0; i < model1.getRowCount(); i++) 
        {
            fRow1 = fSheet1.createRow(i + 1);
            for (int j = 0; j < model1.getColumnCount(); j++) 
            {
                HSSFCell cell = fRow1.createCell(j);
                cell.setCellValue(model1.getValueAt(i, j).toString());
                cell.setCellStyle(cellStyle);
            }
        }
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        BufferedOutputStream bos = new BufferedOutputStream(fileOutputStream);
        table.write(bos);
        bos.close();
        fileOutputStream.close();
    }
    public void FullApplication(int status) throws Exception
    {
        DBEntry[] params = {
            new DBEntry("request_type_id", EntryType.Int, 1),
            new DBEntry("status", EntryType.Int, status)
        };
        DBEntry[] params1 = {
            new DBEntry("request_type_id", EntryType.Int, 2),
            new DBEntry("status", EntryType.Int, status)
        };
        Request[] req = Request.getAll(params);
        Request[] req1 = Request.getAll(params1);
        String[] columnNames = {"Ресурс", "Кол-во", "Дата, гггг-мм-дд", "ФИО", "Местоположение", "Телефон", "Email"};
        Object[][] data = new Object[req.length][7];
        Object[][] data1 = new Object[req1.length][7];
        for (int i = 0; i < req.length; i++)
        {
            data[i][0] = req[i].getResourceName();
            data[i][1] = req[i].getNumber() + " " +  req[i].getMeasureName();
            data[i][2] = req[i].getDateString();
            data[i][3] = Application.getOne(req[i].getApplicationId()).getFullName();
            data[i][4] = Location.getOne(req[i].getLocationId()).getAddress();
            data[i][5] = Application.getOne(req[i].getApplicationId()).getPhone();
            data[i][6] = Application.getOne(req[i].getApplicationId()).getEmail();
        }
        for (int i = 0; i < req1.length; i++)
        {
            data1[i][0] = req1[i].getResourceName();
            data1[i][1] = req1[i].getNumber() + " " + req1[i].getMeasureName();
            data1[i][2] = req1[i].getDateString();
            data1[i][3] = Application.getOne(req1[i].getApplicationId()).getFullName();
            data1[i][4] = Location.getOne(req1[i].getLocationId()).getAddress();
            data1[i][5] = Application.getOne(req1[i].getApplicationId()).getPhone();
            data1[i][6] = Application.getOne(req1[i].getApplicationId()).getEmail();
        }
        JTable jtable = new JTable(data, columnNames);
        JTable jtable1 = new JTable(data1, columnNames);
        HSSFWorkbook table = new HSSFWorkbook();
        HSSFSheet fSheet = table.createSheet("Нуждающиеся ресурсы");
        HSSFSheet fSheet1 = table.createSheet("Пожертвованные ресурсы");
        if (status == 0)
            link += "full_resources_ready.xls";
        else
            link += "full_resources_done.xls";
        File file = new File(link);
        HSSFCellStyle cellStyle = table.createCellStyle();
        TableModel model = jtable.getModel();
        TableModel model1 = jtable1.getModel();
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
        HSSFRow fRow1 = fSheet1.createRow(0);
        for(int j = 0; j < model1.getColumnCount(); j++) 
        {
            HSSFCell cell = fRow1.createCell(j);
            cell.setCellValue(jtable1.getColumnName(j));           
        }
        for (int i = 0; i < model1.getRowCount(); i++) 
        {
            fRow1 = fSheet1.createRow(i + 1);
            for (int j = 0; j < model1.getColumnCount(); j++) 
            {
                HSSFCell cell = fRow1.createCell(j);
                cell.setCellValue(model1.getValueAt(i, j).toString());
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
