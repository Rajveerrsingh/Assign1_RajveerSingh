package com.assign1.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.assign1.model.Registration;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Registration r = new Registration();
        r.setUserId(trim(request.getParameter("userId")));
        r.setPassword(trim(request.getParameter("password")));
        r.setName(trim(request.getParameter("name")));
        r.setAddress(trim(request.getParameter("address")));
        r.setCountry(trim(request.getParameter("country")));
        r.setZip(trim(request.getParameter("zip")));
        r.setEmail(trim(request.getParameter("email")));
        r.setSex(request.getParameter("sex"));
        r.setLanguages(request.getParameterValues("language"));
        r.setAbout(trim(request.getParameter("about")));

        List<String> errors = new ArrayList<>();
        if (r.getUserId().length() < 5 || r.getUserId().length() > 12)
            errors.add("User id must be 5 to 12 characters.");
        if (r.getPassword().length() < 7 || r.getPassword().length() > 12)
            errors.add("Password must be 7 to 12 characters.");
        if (!r.getName().matches("[A-Za-z ]+"))
            errors.add("Name must contain alphabets only.");
        if (r.getCountry().isEmpty())
            errors.add("Select a country.");
        if (!r.getZip().matches("\\d+"))
            errors.add("ZIP code must be numeric.");
        if (!r.getEmail().matches("^[\\w.+-]+@[\\w-]+(\\.[\\w-]+)+$"))
            errors.add("Email must be valid.");
        if (r.getSex() == null)
            errors.add("Select a sex.");
        if (r.getLanguages() == null)
            errors.add("Select at least one language.");

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        request.setAttribute("registration", r);
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }

    private String trim(String s) { return s == null ? "" : s.trim(); }
}