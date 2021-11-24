package models;
import database_conn.Fee_Payment_History_DAO;

import java.io.ByteArrayOutputStream;
import java.util.List;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;

import javax.servlet.http.HttpServlet;

import models.FeeTxnHistory;

public class GeneratePDF {
	private Fee_Payment_History_DAO payDAO; 
    /**
     * @see HttpServlet#HttpServlet()
     */
	public GeneratePDF() {
        payDAO = new Fee_Payment_History_DAO();
    }
	
	public ByteArrayOutputStream getPdfFile(String rollno, String year) {

        Document document = new Document();
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        
        try {
            PdfPTable table = new PdfPTable(3);
            table.setWidthPercentage(60);
            table.setWidths(new int[]{1, 3, 3});

            Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);

            PdfPCell hcell;
            hcell = new PdfPCell(new Phrase("Txn Id", headFont));
            hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(hcell);

            hcell = new PdfPCell(new Phrase("Purpose", headFont));
            hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(hcell);

            hcell = new PdfPCell(new Phrase("Amount", headFont));
            hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(hcell);
            
            List<FeeTxnHistory> txns=payDAO.selectAllTxnByYear(rollno, year);
            
            for (FeeTxnHistory txn : txns) {

                PdfPCell cell;

                cell = new PdfPCell(new Phrase(txn.getTxn_number()));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cell);

                cell = new PdfPCell(new Phrase(txn.getTxn_purpose()));
                cell.setPaddingLeft(5);
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(cell);

                cell = new PdfPCell(new Phrase(String.valueOf(txn.getTxn_amt())));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                cell.setPaddingRight(5);
                table.addCell(cell);
            }

            PdfWriter.getInstance(document, bout);
            document.open();
            document.add(table);
            
            document.close();
            
        } catch(Exception ex) {
        
            Logger.getLogger(GeneratePDF.class.getName()).log(Level.SEVERE, null, ex);
        }

        return bout; 
    }
}
