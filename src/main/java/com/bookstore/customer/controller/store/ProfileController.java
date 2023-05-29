package com.bookstore.customer.controller.store;

import com.bookstore.dao.*;
import com.bookstore.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.UUID;

@WebServlet(name = "ProfileController", value = "/profile")
public class ProfileController extends HttpServlet {

    private static final String CSRF_TOKEN_NAME = "csrfToken";
    private static final String SECRET_KEY = UUID.randomUUID().toString();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");

        // Create a random string for CSRF token
        String token = generateToken();

        // Store the CSRF token in the session.
        request.getSession().setAttribute(CSRF_TOKEN_NAME, token);
        User user = (User) request.getSession().getAttribute("acc");
        System.out.println("acc: " + user.getEmail());
        request.getRequestDispatcher("/store/views/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        response.setContentType("text/html");
        String message = "";

        // Get the CSRF token from the request.
        String CSRFTokenFromRequest = request.getParameter(CSRF_TOKEN_NAME);
        // Get the CSRF token from the session.
        String CSRFTokenFromSession = (String) session.getAttribute(CSRF_TOKEN_NAME);
        if (CSRFTokenFromRequest == null || !CSRFTokenFromSession.equals(CSRFTokenFromRequest)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        } else {


            System.out.println("Vào được doPost");

            String name = request.getParameter("name").trim();
            String address = request.getParameter("address").trim();
            String phone = request.getParameter("phone").trim();
            String email = request.getParameter("email").trim();
            String image = request.getParameter("image").trim();

            User user = new User();
            user = (User) session.getAttribute("acc");
            int id = user.getId();

            UserDAO userDAO = new UserDAO();
//      Check unique cho email và phone
            String errorMessage = "";
            if (!userDAO.isValidUpdateEmail(email, id) && userDAO.isExistEmail(email)) {
                errorMessage = "Địa chỉ Email đã tồn tại, vui lòng nhập Địa chỉ Email khác";
            }
            if (!userDAO.isValidUpdatePhone(phone, id) && userDAO.isExistPhone(phone)) {
                if (errorMessage.equals("")) {
                    errorMessage = "Số điện thoại đã tồn tại, vui lòng nhập Số điện thoại khác";
                } else {
                    errorMessage = "Email và số điện thoại đã tồn tại\nVui lòng nhập lại.";
                }
            }
            System.out.println("Error Message: " + errorMessage);

            if (errorMessage == "") {
                //      Update: begin
                user.setName(name);
                user.setPhone(phone);
                user.setEmail(email);
                user.setAddress(address);
                user.setImage(image);
                try {
                    userDAO.update(user);
                    System.out.println("Update User thành công");
                    message = "Cập nhật thông tin thành công.";
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    System.out.println("Update User không thành công");
                    e.printStackTrace();
                }
                request.setAttribute("acc", user);
//          Update: End
            }
            request.setAttribute("update_error", errorMessage);
            request.setAttribute("message", message);
            request.getRequestDispatcher("/store/views/profile.jsp").forward(request, response);
        }
    }

    private String generateToken() {
        long timestamp = System.currentTimeMillis();

        // Combine timestamp and secret key
        String data = timestamp + SECRET_KEY;

        try {
            // Generate a SHA-256 hash of the data
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(data.getBytes());

            // Encode the hash as a Base64 string
            return Base64.getUrlEncoder().withoutPadding().encodeToString(hash);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return null;
    }
}
