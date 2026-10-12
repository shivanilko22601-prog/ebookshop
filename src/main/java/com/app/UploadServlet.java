package com.app;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(maxFileSize = 10_000_000L)
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        if (!"Admin".equals(req.getSession().getAttribute("usertype"))) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Please log in as the demo administrator to add books.");
            return;
        }
        String name = req.getParameter("txt_bname");
        String publication = req.getParameter("txt_publication");
        String category = req.getParameter("cmb_category");
        String subcategory = req.getParameter("cmb_scategory");
        String details = req.getParameter("txt_details");
        double cost;
        try { cost = Double.parseDouble(req.getParameter("txt_cost")); }
        catch (Exception e) { resp.sendError(400, "Enter a valid book price."); return; }
        if (name == null || name.isBlank() || publication == null || publication.isBlank() ||
                category == null || category.isBlank() || subcategory == null || subcategory.isBlank() ||
                details == null || details.isBlank() || cost < 0) {
            resp.sendError(400, "Please complete every book detail and enter a non-negative price.");
            return;
        }
        Connection cn = (Connection)getServletContext().getAttribute("CONN");
        if (cn == null) { resp.sendError(503, "Database is not connected. Follow README.md setup steps."); return; }
        try {
            Part image = req.getPart("file_upload");
            String sql = "INSERT INTO books(bname,bpublication,bdetail,bcost,cover_image,bcategory,bsubcategory) VALUES(?,?,?,?,?,?,?)";
            try (PreparedStatement ps = cn.prepareStatement(sql)) {
                ps.setString(1, name.trim()); ps.setString(2, publication.trim()); ps.setString(3, details.trim());
                ps.setDouble(4, cost);
                if (image == null || image.getSize() == 0) ps.setNull(5, java.sql.Types.BLOB);
                else try (InputStream stream = image.getInputStream()) { ps.setBlob(5, stream); }
                ps.setString(6, category); ps.setString(7, subcategory);
                ps.executeUpdate();
            }
            resp.getWriter().printf("<!doctype html><html><meta charset='UTF-8'><link rel='stylesheet' href='css/style.css'><body><main class='content-card'><h2>Book added</h2><p>%s is now in the catalog.</p><a class='button-link' href='BEntry.jsp'>Add another book</a> <a class='button-link' href='computer.jsp'>View catalog</a></main></body></html>",
                    escape(name.trim()));
        } catch (Exception e) {
            getServletContext().log("Could not save a book", e);
            resp.sendError(500, "The book could not be saved. Check the database setup and try again.");
        }
    }

    private String escape(String value) {
        return value.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
    }
}
