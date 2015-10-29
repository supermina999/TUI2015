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

public class MakeFileXLS {
    
    public void makeFile(JTable jtable, String resource_name) throws IOException
    {
        HSSFWorkbook table = new HSSFWorkbook();
        HSSFSheet fSheet = table.createSheet(resource_name);

        File file = new File("table.xls");
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
